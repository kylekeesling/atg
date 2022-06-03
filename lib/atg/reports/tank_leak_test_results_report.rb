# frozen_string_literal: true

module Atg
  class TankLeakTestResultsReport < Report
    def command_code
      "i20800"
    end

    def result_object
      TankLeakTestResult
    end

    def parse_response_results
      tank_number = @results_data[@cursor..(@cursor += 1)]
      results_to_follow = @results_data[(@cursor += 1)..(@cursor += 1)].to_i(16)

      parse_repeating_result_block \
        result_length: 40,
        results_to_follow: results_to_follow,
        prepend_to_result: tank_number

      @results
    end
  end
end
