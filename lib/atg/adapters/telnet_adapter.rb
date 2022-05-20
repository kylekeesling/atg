# frozen_string_literal: true

require "net/telnet"

module Atg
  class TelnetAdapter < Base
    RETRY_WAIT = 3

    def initialize(ip_address:, port: 23, timeout: 3)
      tries ||= 3

      @telnet =
        Net::Telnet.new \
          "Host" => ip_address,
          "Port" => port,
          "Timeout" => timeout,
          "Prompt" => /#{EXT}/o
    rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH, Errno::EADDRNOTAVAIL, Net::OpenTimeout => error
      if (tries -= 1).positive?
        sleep RETRY_WAIT
        retry
      else
        raise ConnectionError.new("could not connect to #{ip_address}:#{port} - #{error}")
      end
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
