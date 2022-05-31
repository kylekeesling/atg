# frozen_string_literal: true

module Atg
  class Sensor < Base
    attr_accessor :number, :label

    def initialize(data)
      @number = data[0..1]
      @label = data[2..21].rstrip
    end

    def type
      # define in the subclass
    end
  end
end
