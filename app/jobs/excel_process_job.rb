# app/jobs/excel_process_job.rb
class ExcelProcessJob < ApplicationJob
  faktory_options retry: 2
  queue_as :default

  def perform(file)
    Document.process_excel(file: file)
  end
end
