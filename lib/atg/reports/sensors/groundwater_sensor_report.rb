# frozen_string_literal: true

module Atg
  class GroundwaterSensorReport < Report
    ENTRY_LENGTH = 22
    ENTRY_START_POSITION = 16

    def self.code
      "i71200"
    end

    def self.response_object
      GroundwaterSensor
    end
  end
end
