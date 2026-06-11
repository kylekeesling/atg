# frozen_string_literal: true

module Atg
  class TankDeliveryRequiredLimitReport < Report
    def command_code
      "i62900"
    end

    def result_object
      TankDeliveryRequiredLimit
    end

    def result_length
      10
    end
  end
end
