# frozen_string_literal: true

module Atg
  class SmartSensorStatusReport < Report
    def self.code
      "i31500"
    end

    def self.response_object
      SensorStatusResult
    end
  end
end
