# frozen_string_literal: true

module Atg
  class ThreeWireSensorReport < Report
    ENTRY_LENGTH = 22
    ENTRY_START_POSITION = 16

    def self.code
      "i74200"
    end

    def self.response_object
      ThreeWireSensor
    end
  end
end
