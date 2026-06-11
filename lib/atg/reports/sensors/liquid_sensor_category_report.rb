# frozen_string_literal: true

module Atg
  class LiquidSensorCategoryReport < Report
    def command_code
      "i70400"
    end

    def result_object
      LiquidSensorCategory
    end

    def result_length
      3
    end
  end
end
