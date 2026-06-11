# frozen_string_literal: true

module Atg
  class TankSuddenLossLimit < Base
    attr_accessor :number, :sudden_loss_limit

    def initialize(data)
      @number = data[0..1]
      @sudden_loss_limit = ieee754_value(data[2..9])
    end
  end
end
