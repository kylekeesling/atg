# frozen_string_literal: true

module Atg
  class SystemRevisionReport < Report
    def command_code
      "i90200"
    end

    def result_object
      SystemRevision
    end

    private

    # 902 returns a single record with embedded ASCII labels rather than
    # repeating fixed-width blocks, so the default slicing does not apply.
    def parse_response_results
      [result_object.new(@results_data)]
    end
  end
end
