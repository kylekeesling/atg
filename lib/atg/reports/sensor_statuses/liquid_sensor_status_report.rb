# frozen_string_literal: true

module Atg
  class LiquidSensorStatusReport < Report
    def self.code
      "i30100"
    end

    def self.response_object
      SensorStatusResult
    end
  end
end
