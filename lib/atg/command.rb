# frozen_string_literal: true

module Atg
  class Command < Base
    attr_accessor :code, :data_field

    def initialize(code:, response_object:, adapter:, data_field: nil)
      @code = code
      @response_object = response_object
      @data_field = data_field
      @adapter = adapter
      @command_string = command = [SOH, @code, @data_field].reject(&:nil?).join
    end

    def issue!
      response_string = @adapter.write(@command_string)
      Response.new(response_string, code: @code, type: @response_object)
    end
  end
end
