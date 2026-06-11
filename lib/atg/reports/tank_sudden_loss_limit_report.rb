# frozen_string_literal: true

module Atg
  class TankSuddenLossLimitReport < Report
    def command_code
      "i62500"
    end

    def result_object
      TankSuddenLossLimit
    end

    def result_length
      10
    end
  end
end
