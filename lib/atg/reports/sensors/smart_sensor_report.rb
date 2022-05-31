# frozen_string_literal: true

module Atg
  class SmartSensorReport < Report
    ENTRY_LENGTH = 22
    ENTRY_START_POSITION = 16

    def self.code
      "i72200"
    end

    def self.response_object
      SmartSensor
    end
  end
end
