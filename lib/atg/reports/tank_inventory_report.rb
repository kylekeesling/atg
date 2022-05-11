# frozen_string_literal: true

module Atg
  class TankInventoryReport < Report
    def self.code
      "i20100"
    end

    def self.response_object
      InventoryRecord
    end
  end
end
