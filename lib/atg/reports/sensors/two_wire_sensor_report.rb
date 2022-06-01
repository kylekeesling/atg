# frozen_string_literal: true

module Atg
  class TwoWireSensorReport < Report
    def self.code
      "i74200"
    end

    def self.response_object
      TwoWireSensor
    end
  end
end
