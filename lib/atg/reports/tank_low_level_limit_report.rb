# frozen_string_literal: true

module Atg
  class TankLowLevelLimitReport < Report
    def command_code
      "i62100"
    end

    def result_object
      TankLowLevelLimit
    end

    def result_length
      10
    end
  end
end
