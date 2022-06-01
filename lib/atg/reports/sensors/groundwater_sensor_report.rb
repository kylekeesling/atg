# frozen_string_literal: true

module Atg
  class GroundwaterSensorReport < Report
    def self.code
      "i71200"
    end

    def self.response_object
      GroundwaterSensor
    end
  end
end
