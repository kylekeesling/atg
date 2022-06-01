# frozen_string_literal: true

module Atg
  class ThreeWireSensorReport < Report
    def command_code
      "i74200"
    end

    def result_object
      ThreeWireSensor
    end

    def result_length
      22
    end
  end
end
