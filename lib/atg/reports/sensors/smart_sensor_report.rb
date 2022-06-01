# frozen_string_literal: true

module Atg
  class SmartSensorReport < Report
    def command_code
      "i72200"
    end

    def result_object
      SmartSensor
    end

    def result_length
      22
    end
  end
end
