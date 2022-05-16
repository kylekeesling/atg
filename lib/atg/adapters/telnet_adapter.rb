# frozen_string_literal: true

require "net/telnet"

module Atg
  class TelnetAdapter < Base
    def initialize(ip_address:, port: 23, timeout: 3)
      @telnet =
        Net::Telnet.new \
          "Host" => ip_address,
          "Port" => port,
          "Timeout" => timeout,
          "Prompt" => /#{EXT}/o
    end

    def description
      "TCP/IP (Telnet)"
    end

    def write(command_string)
      @telnet.cmd(command_string)
    end

    def close
      # this may not always get explicity called and the connection and
      # will otherwise fallback on the timeout specified (in seconds)
      # but we should call it whenever possible to avoid overloading/DDOSing
      # the ATG's network card
      @telnet.close
    end
  end
end
