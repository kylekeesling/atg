# frozen_string_literal: true

module Atg
  class PriorityAlarmHistoryReport < Report
    def command_code
      "i11100"
    end

    def result_object
      Alarm
    end

    def result_length
      20
    end
  end
end
