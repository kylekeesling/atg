# frozen_string_literal: true

module Atg
  class ActiveAlarmReport < Report
    def command_code
      "i11300"
    end

    def result_object
      ActiveAlarm
    end

    def result_length
      18
    end

    def results_start_position
      96
    end
  end
end
