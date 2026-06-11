# frozen_string_literal: true

module Atg
  class TankDensityReport < Report
    def command_code
      "i61E00"
    end

    def result_object
      TankDensity
    end

    def result_length
      10
    end
  end
end
