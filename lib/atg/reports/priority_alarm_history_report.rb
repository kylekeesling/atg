# frozen_string_literal: true

module Atg
  class PriorityAlarmHistoryReport < Report
    def self.code
      "i11100"
    end

    def self.response_object
      Alarm
    end
  end
end
