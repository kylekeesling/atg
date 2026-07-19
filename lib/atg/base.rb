# frozen_string_literal: true

require "date"

module Atg
  class Base
    # Parses a 10-digit YYMMDDHHmm stamp. Some live TLS-350 frames carry a
    # garbled stamp (bad month/day, stray characters); one unparseable stamp
    # must not raise and sink the whole report, so return nil — matching
    # SystemRevision#parse_created.
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
    rescue ArgumentError
      nil
    end

    def ieee754_value(hex_value)
      [hex_value].pack("H8").unpack1("g")
    end
  end
end
