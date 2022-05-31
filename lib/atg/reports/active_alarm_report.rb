# frozen_string_literal: true

module Atg
  class ActiveAlarmReport < Report
    ENTRY_LENGTH = 18
    ENTRY_START_POSITION = 96

    def self.code
      "i11300"
    end

    def self.response_object
      ActiveAlarm
    end
  end
end
