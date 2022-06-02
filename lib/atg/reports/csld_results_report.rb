# frozen_string_literal: true

module Atg
  class CsldResultsReport < Report
    def command_code
      "i25100"
    end

    def result_object
      CsldResult
    end

    def result_length
      4
    end
  end
end
