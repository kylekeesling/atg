# frozen_string_literal: true

module Atg
  class Command < Base
    attr_accessor :code, :report, :data_field

    def initialize(report:, adapter:, data_field: nil)
      @report = report
      @code = @report.code
      @response_object = @report.response_object

      @data_field = data_field
      @adapter = adapter

      @command_string = [SOH, @code, @data_field].reject(&:nil?).join
    end

    def issue!
      response_string = @adapter.write(@command_string)
      Response.new(response_string, report: @report)
    end
  end
end
