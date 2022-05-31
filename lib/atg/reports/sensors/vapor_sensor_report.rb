# frozen_string_literal: true

module Atg
  class VaporSensorReport < Report
    ENTRY_LENGTH = 22
    ENTRY_START_POSITION = 16

    def self.code
      "i70700"
    end

    def self.response_object
      VaporSensor
    end
  end
end
