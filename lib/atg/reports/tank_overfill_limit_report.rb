# frozen_string_literal: true

module Atg
  class TankOverfillLimitReport < Report
    def command_code
      "i62300"
    end

    def result_object
      TankOverfillLimit
    end

    def result_length
      10
    end
  end
end
