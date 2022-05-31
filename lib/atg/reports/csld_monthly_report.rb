# frozen_string_literal: true

module Atg
  class CsldMonthlyReport < Report
    ENTRY_LENGTH = 16
    ENTRY_START_POSITION = 16

    def self.code
      "iA5600"
    end

    def self.default_data_field
      # report_type
      # 0=Current Month
      # 1=Previous Month
      0
    end

    def self.response_object
      CsldResult
    end
  end
end
