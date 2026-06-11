# frozen_string_literal: true

module Atg
  class TankHighLevelLimitReport < Report
    def command_code
      "i62200"
    end

    def result_object
      TankHighLevelLimit
    end

    def result_length
      10
    end
  end
end
