# frozen_string_literal: true

module Atg
  class SmartSensorReport < Report
    def self.code
      "i72200"
    end

    def self.response_object
      SmartSensor
    end
  end
end
