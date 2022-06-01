# frozen_string_literal: true

module Atg
  class CsldMonthlyReport < Report
    def command_code
      "iA5600"
    end

    def result_object
      CsldResult
    end

    def result_length
      16
    end
  end
end
