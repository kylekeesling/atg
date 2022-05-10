# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "atg"

require "minitest/autorun"
require "minitest/mock"

class Minitest::Test
  SERIAL_PORT = "/dev/tty"

  # def setup
  #   @ports = []

  #   File.delete("socat.log") if File.file?("socat.log")

  #   raise "socat not found" unless `socat -h` && $? == 0

  #   Thread.new do
  #     system("socat -lf socat.log -d -d pty,raw,echo=0 pty,raw,echo=0")
  #   end

  #   @ptys = nil

  #   loop do
  #     if File.file? "socat.log"
  #       @file = File.open("socat.log", "r")
  #       @fileread = @file.read

  #       unless @fileread.count("\n") < 3
  #         @ptys = @fileread.scan(/PTY is (.*)/)
  #         break
  #       end
  #     end
  #   end

  #   @ports = [@ptys[1][0], @ptys[0][0]]

  #   @sp2 = Serial.new(@ports[0])
  #   @sp = Serial.new(@ports[1])
  # end

  # def teardown
  #   @sp2.close
  #   @sp.close
  # end
end
