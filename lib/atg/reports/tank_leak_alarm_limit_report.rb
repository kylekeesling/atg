# frozen_string_literal: true

module Atg
  class TankLeakAlarmLimitReport < Report
    def command_code
      "i62600"
    end

    def result_object
      TankLeakAlarmLimit
    end

    def result_length
      10
    end
  end
end
