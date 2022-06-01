# frozen_string_literal: true

module Atg
  class LiquidSensorStatusReport < Report
    def command_code
      "i30100"
    end

    def result_object
      SensorStatusResult
    end

    def result_length
      6
    end
  end
end
