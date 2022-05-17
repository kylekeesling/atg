# frozen_string_literal: true

require "rubyserial"

module Atg
  class SerialAdapter < Base
    def initialize(port:)
      @serial = Serial.new(port)
    rescue RubySerial::Error
      raise ConnectionError.new("could not connect to serial port (#{port})")
    end

    def description
      "Serial (RS-232)"
    end

    def write(command_string)
      @serial.write(command_string)
      @serial.gets(EXT)
    end

    def close
      # noop - serial connections do not need to be closed
    end
  end
end
