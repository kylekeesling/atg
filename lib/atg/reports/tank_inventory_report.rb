# frozen_string_literal: true

module Atg
  class TankInventoryReport < Report
    ENTRY_LENGTH = 65
    ENTRY_START_POSITION = 16

    def self.code
      "i20100"
    end

    def self.response_object
      InventoryRecord
    end
  end
end
