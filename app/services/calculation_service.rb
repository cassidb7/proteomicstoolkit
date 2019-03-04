# app/services/calculation_service.rb
require 'write_xlsx'

# require 'axlsx_rails'
class CalculationService

  def initialize(document_id:)
    @document_id = document_id
    @records = []
  end

  def call
    unique_proteins = Content.all.pluck(:protein).uniq
    intensities = Header.find_intensities('intensity', @document_id)
    unique_proteins.each do |p|
      row = [p]
      intensities.each_with_index do |i, index|
        intensity_index = index + 1
        row << Content.get_max_limit(protein: p, intensity: intensity_index)
      end
      @records << row
    end
    write_to_excel
  end

  private

  def write_to_excel
    # Create a new Excel workbook±
    workbook = WriteXLSX.new(Rails.root.join("public", "test.xlsx"))
    # Add a worksheet
    worksheet = workbook.add_worksheet
    @records.each_with_index do |row, index|
      worksheet.write_row(index, 0, row)
    end
    workbook.close
  end
end
