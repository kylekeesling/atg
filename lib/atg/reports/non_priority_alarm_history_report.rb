# frozen_string_literal: true

module Atg
  class NonPriorityAlarmHistoryReport < Report
    def command_code
      "i11200"
    end

    def result_object
      Alarm
    end

    def result_length
      20
    end
  end
end
