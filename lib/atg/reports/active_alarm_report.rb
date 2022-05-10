# frozen_string_literal: true

module Atg
  class ActiveAlarmReport < Report
    private

    def self.code
      "i11300"
    end

    def self.response_object
      ActiveAlarm
    end
  end
end
