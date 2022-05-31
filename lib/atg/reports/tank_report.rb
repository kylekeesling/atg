# frozen_string_literal: true

module Atg
  class TankReport < Report
    ENTRY_LENGTH = 22
    ENTRY_START_POSITION = 16

    def self.code
      "i60200"
    end

    def self.response_object
      Tank
    end
  end
end
