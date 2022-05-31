# frozen_string_literal: true

module Atg
  class TankLeakTestHistoryReport < Report
    ENTRY_LENGTH = 44
    ENTRY_START_POSITION = 16

    def self.code
      "i20700"
    end

    def self.response_object
      TankLeakTestHistoryRecord
    end
  end
end
