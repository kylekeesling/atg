# frozen_string_literal: true

module Atg
  class PriorityAlarmHistoryReport < Report
    ENTRY_LENGTH = 20
    ENTRY_START_POSITION = 16

    def self.code
      "i11100"
    end

    def self.response_object
      Alarm
    end
  end
end
