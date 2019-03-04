# app/services/excel_processor_creation_service.rb
require 'roo'
class ExcelProcessorService
  BATCH_IMPORT_SIZE = 1000

  def initialize(file:, document_id:)
    @file = file
    @document_id = document_id
    @records = []
    @counter = 1
  end

  def call
    xlsx = Roo::Excelx.new(@file)
    save_headers(header: xlsx.sheet(0).row(1))
    stream_excel(xlsx)
  end

  private
  attr_reader :file, :records, :document_id
  attr_accessor :counter

  def stream_excel(xlsx)
    headers = retrieve_headers("intensity", document_id)
    header_sequence = headers.map { |h| h.sequence }
    protein = retrieve_protein("Proteins", document_id)
    xlsx.sheet(0).each_row_streaming do |row|
      params = {}
      params.merge!(cleanse_protein(row[protein.sequence]))
      params.merge!({:document_id => document_id})
      params.merge!(retrieve_intensities(row, header_sequence))
      increment_counter
      records << params

      import_records if reached_batch_import_size? || reached_end_of_file?(total: xlsx.sheet(0).last_row)

      CalculationService.new(document_id: @document_id).call if reached_end_of_file?(total: xlsx.sheet(0).last_row)
    end
  end

  def increment_counter
    @counter += 1
  end

  def row_count
    @row_count ||= xlsx.sheets.first.rows.count
  end

  def save_headers(header:)
    header.each_with_index do |h, index|
      Header.create(document_id: @document_id, name: h, sequence: index)
    end
  end

  def retrieve_headers(term, document_id)
    Header.find_intensities(term, document_id)
  end

  def retrieve_protein(term, document_id)
    Header.find_proteins(term, document_id)
  end

  def retrieve_intensities(row, header_sequence)
    max_row = 30
    intensity_param = {}
    header_sequence.each_with_index do |h, index|

      next if h < max_row
      column_name = "intensity_"+ "#{index + 1}"
      intensity_param.merge!({column_name.to_sym => row[h]&.to_s&.to_f})
    end
    intensity_param
  end

  def cleanse_protein(protein)
    {:protein =>  protein&.to_s[/^[^\;]*/]}
  end

  def import_records
    # save multiple records using activerecord-import gem
    Content.import(records)

    # clear records array
    records.clear
  end

  def reached_batch_import_size?
    (counter % BATCH_IMPORT_SIZE).zero?
  end

  def reached_end_of_file?(total:)
    counter == total&.to_i
  end
end
