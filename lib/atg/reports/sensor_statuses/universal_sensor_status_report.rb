# frozen_string_literal: true

module Atg
  class UniversalSensorStatusReport < Report
    def self.code
      "i34B00"
    end

    def self.response_object
      SensorStatusResult
    end
  end
end
