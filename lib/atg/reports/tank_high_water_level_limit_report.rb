# frozen_string_literal: true

module Atg
  class TankHighWaterLevelLimitReport < Report
    def command_code
      "i62400"
    end

    def result_object
      TankHighWaterLevelLimit
    end

    def result_length
      10
    end
  end
end
