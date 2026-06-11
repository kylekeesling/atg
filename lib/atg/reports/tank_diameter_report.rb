# frozen_string_literal: true

module Atg
  class TankDiameterReport < Report
    def command_code
      "i60700"
    end

    def result_object
      TankDiameter
    end

    def result_length
      10
    end
  end
end
