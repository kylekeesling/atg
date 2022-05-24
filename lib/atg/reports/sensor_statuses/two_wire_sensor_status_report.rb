# frozen_string_literal: true

module Atg
  class TwoWireSensorStatusReport < Report
    def self.code
      "i34100"
    end

    def self.response_object
      SensorStatusResult
    end
  end
end
