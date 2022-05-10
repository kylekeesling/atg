# frozen_string_literal: true

require "digest"

module Atg
  class Tank < Base
    attr_accessor :id, :number, :product_label

    ENTRY_LENGTH = 22
    ENTRY_START_POSITION = 16

    def initialize(data)
      @number = data[0..1]
      @id = @number.to_i
      @product_label = data[2..21].rstrip
    end
  end
end
