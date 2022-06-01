# frozen_string_literal: true

module Atg
  class ThreeWireSensorStatusReport < Report
    def self.code
      "i34600"
    end

    def self.response_object
      SensorStatusResult
    end
  end
end
