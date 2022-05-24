# frozen_string_literal: true

module Atg
  class VaporSensorReport < Report
    def self.code
      "i70700"
    end

    def self.response_object
      VaporSensor
    end
  end
end
