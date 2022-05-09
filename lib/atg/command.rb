# frozen_string_literal: true

require "rubyserial"

module Atg
  class Command < Base
    attr_accessor :code, :data_field

    SOH = "\x01" # Start of Heading
    EXT = "\x03" # End of Text
    UNRECOGNIZED_RESPONSE_CODE = "9999FF1B"

    def initialize(port:, code:, response_object:, data_field: nil)
      @serial_port = Serial.new(port)
      @code = code
      @response_object = response_object
      @data_field = data_field
    end

    def issue!
      command = [SOH, @code, @data_field].reject(&:nil?).join

      puts "======================================="
      puts "command (#{command}) issued #{Time.now}"
      puts "======================================="

      request = @serial_port.write(command)

      response = @serial_port.gets(EXT)
      response.delete!(SOH)
      response.delete!(EXT)

      if response == UNRECOGNIZED_RESPONSE_CODE
        raise Atg::CommandNotRecognizedError.new("'#{@code}' is not a recognized command")
      else
        Response.new(response, type: @response_object)
      end
    end
  end
end
