# frozen_string_literal: true

module Atg
  class GroundwaterSensorReport < Report
    def command_code
      "i71200"
    end

    def result_object
      GroundwaterSensor
    end

    def result_length
      22
    end
  end
end
