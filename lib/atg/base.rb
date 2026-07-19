# frozen_string_literal: true

require "date"

module Atg
  class Base
    # Parses a 10-digit YYMMDDHHmm stamp into a DateTime. A malformed stamp
    # raises ArgumentError ("invalid date"). A real device frame always carries
    # a valid timestamp, so an unparseable one signals the frame isn't a real
    # device response (e.g. a gateway failure marker that echoes the command
    # code) — the caller should treat it as a failed command rather than let
    # the garbage parse into results. (An earlier guard swallowed this to nil,
    # which masked exactly those timeouts, so it was reverted.)
    def parse_timestamp(timestamp)
      year = timestamp[0..1].to_i

      year =
        if year.between?(80, 99)
          "19#{timestamp[0..1]}".to_i
        else
          "20#{timestamp[0..1]}".to_i
        end

      month = timestamp[2..3].to_i
      day = timestamp[4..5].to_i
      hour = timestamp[6..7].to_i
      minute = timestamp[8..9].to_i

      DateTime.new(year, month, day, hour, minute)
    end

    def ieee754_value(hex_value)
      [hex_value].pack("H8").unpack1("g")
    end
  end
end
