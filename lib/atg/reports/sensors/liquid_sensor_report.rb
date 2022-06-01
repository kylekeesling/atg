# frozen_string_literal: true

module Atg
  class LiquidSensorReport < Report
    def command_code
      "i70200"
    end

    def result_object
      LiquidSensor
    end

    def result_length
      22
    end
  end
end
