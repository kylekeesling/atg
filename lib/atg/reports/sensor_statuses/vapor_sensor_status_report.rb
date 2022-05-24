# frozen_string_literal: true

module Atg
  class VaporSensorStatusReport < Report
    def self.code
      "i30600"
    end

    def self.response_object
      SensorStatusResult
    end
  end
end
