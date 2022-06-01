# frozen_string_literal: true

module Atg
  class GroundwaterSensorStatusReport < Report
    def self.code
      "i31100"
    end

    def self.response_object
      SensorStatusResult
    end
  end
end
