# frozen_string_literal: true

module Atg
  class TankHighWaterWarningLimitReport < Report
    def command_code
      "i62700"
    end

    def result_object
      TankHighWaterWarningLimit
    end

    def result_length
      10
    end
  end
end
