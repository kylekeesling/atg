# frozen_string_literal: true

module Atg
  class LiquidSensorReport < Report
    def self.code
      "i70200"
    end

    def self.response_object
      LiquidSensor
    end
  end
end
