# frozen_string_literal: true

module Atg
  class ThreeWireSensorReport < Report
    def self.code
      "i74200"
    end

    def self.response_object
      ThreeWireSensor
    end
  end
end
