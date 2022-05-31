# frozen_string_literal: true

module Atg
  class UniversalSensorReport < Report
    ENTRY_LENGTH = 22
    ENTRY_START_POSITION = 16

    def self.code
      "i74C00"
    end

    def self.response_object
      UniversalSensor
    end
  end
end
