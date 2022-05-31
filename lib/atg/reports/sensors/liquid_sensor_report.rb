# frozen_string_literal: true

module Atg
  class LiquidSensorReport < Report
    ENTRY_LENGTH = 22
    ENTRY_START_POSITION = 16

    def self.code
      "i70200"
    end

    def self.response_object
      LiquidSensor
    end
  end
end
