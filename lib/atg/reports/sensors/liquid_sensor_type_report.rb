# frozen_string_literal: true

module Atg
  class LiquidSensorTypeReport < Report
    def command_code
      "i70300"
    end

    def result_object
      LiquidSensorType
    end

    def result_length
      3
    end
  end
end
