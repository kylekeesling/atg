# frozen_string_literal: true

module Atg
  class TankThermalCoefficientReport < Report
    def command_code
      "i60900"
    end

    def result_object
      TankThermalCoefficient
    end

    def result_length
      10
    end
  end
end
