# frozen_string_literal: true

require "digest"

module Atg
  class Tank < Base
    attr_accessor :number, :product_label

    def initialize(data)
      @number = data[0..1]
      @product_label = data[2..21].rstrip
    end
  end
end
