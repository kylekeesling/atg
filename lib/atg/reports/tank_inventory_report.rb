# frozen_string_literal: true

module Atg
  class TankInventoryReport < Report
    def command_code
      "i20100"
    end

    def result_object
      InventoryRecord
    end

    def result_length
      65
    end
  end
end
