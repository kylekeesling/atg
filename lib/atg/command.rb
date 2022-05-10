# frozen_string_literal: true

require "rubyserial"
require "net/telnet"

module Atg
  class Command < Base
    attr_accessor :code, :data_field

    def initialize(code:, response_object:, serial_port: nil, ip_address: nil, port: 23, data_field: nil)
      @code = code
      @response_object = response_object
      @data_field = data_field
      @command_string = command = [SOH, @code, @data_field].reject(&:nil?).join

      if serial_port
        @serial_port = serial_port
        @method = "Serial (RS-232)"
      elsif ip_address
        @ip_address = ip_address
        @port = port
        @method = "TCP/IP (Telnet)"
      else
        raise StandardError.new("a serial_port or ip_address must be provided")
      end
    end

    def issue!
      time = Time.now.strftime("%Y-%m-%d %H:%M:%S")
      puts "======================================="
      puts "command #{@command_string} issued #{time} via #{@method}"
      puts "======================================="

      response_string =
        if @serial_port
          issue_serial_command
        elsif @ip_address
          issue_telnet_command
        end

      Response.new(response_string, code: @code, type: @response_object)
    end

    private

    def issue_serial_command
      serial = Serial.new(@serial_port)
      serial.write(@command_string)
      serial.gets(EXT)
    end

    def issue_telnet_command
      telnet = Net::Telnet.new \
        "Host" => @ip_address,
        "Port" => @port,
        "Prompt" => /#{EXT}/o

      response = telnet.cmd(@command_string)
      telnet.close
      sleep 0.2

      response
    end
  end
end
