# frozen_string_literal: true

module Atg
  class TankLeakTestHistoryReport < Report
    def self.code
      "i20700"
    end

    def self.response_object
      TankLeakTestHistoryRecord
    end
  end
end
