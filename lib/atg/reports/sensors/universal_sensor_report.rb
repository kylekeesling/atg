# frozen_string_literal: true

module Atg
  class UniversalSensorReport < Report
    def self.code
      "i74C00"
    end

    def self.response_object
      UniversalSensor
    end
  end
end
