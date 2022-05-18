# frozen_string_literal: true

module Atg
  class NonPriorityAlarmHistoryReport < Report
    def self.code
      "i11200"
    end

    def self.response_object
      Alarm
    end
  end
end
