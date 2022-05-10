# frozen_string_literal: true

module Atg
  class TankLeakTestReport < Report
    private

    def self.code
      "i20700"
    end

    def self.response_object
      TankLeakTestResult
    end
  end
end
