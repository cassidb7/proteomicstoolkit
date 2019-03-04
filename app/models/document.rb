class Document < ApplicationRecord
  # associations
  belongs_to :user
  has_many :header
  has_many :contents

  Uploading   = 10
  Processing  = 20
  Complete    = 30


  def self.process_excel(file)
    ExcelProcessorService.new(file).call
  end
end
