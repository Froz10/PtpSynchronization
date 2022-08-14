# frozen_string_literal: true

class HostBulkService < ApplicationService
  attr_reader :exel_file

  def initialize(exel_file_param)
    @exel_file = exel_file.tempfile
  end

  def call
    Host.import hosts_from(exel_file), ignore: true
  end

  private

  def hosts_from(exel_file)
    sheet = RubyXL::Parser.parse_buffer(exel_file.read)[0]
    sheet.map do |row|
      cells = row.cells[0..2].map { |c| c&.value.to_s }
      Host.new name: cells[0],
               email: cells[1],
               password: cells[2],
               password_confirmation: cells[2]
    end
  end
end
