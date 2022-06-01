# frozen_string_literal: true

module Atg
  class VaporSensorReport < Report
    def command_code
      "i70700"
    end

    def result_object
      VaporSensor
    end

    def result_length
      22
    end
  end
end
