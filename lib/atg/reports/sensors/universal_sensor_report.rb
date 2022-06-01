# frozen_string_literal: true

module Atg
  class UniversalSensorReport < Report
    def command_code
      "i74C00"
    end

    def result_object
      UniversalSensor
    end

    def result_length
      22
    end
  end
end
