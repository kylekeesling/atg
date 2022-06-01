# frozen_string_literal: true

module Atg
  class UniversalSensorStatusReport < Report
    def command_code
      "i34B00"
    end

    def result_object
      SensorStatusResult
    end

    def result_length
      6
    end
  end
end
