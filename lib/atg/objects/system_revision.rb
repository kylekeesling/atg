# frozen_string_literal: true

require "date"

module Atg
  class SystemRevision < Base
    attr_accessor :software_number, :base_number, :version, :revision, :created_at

    # data is the results portion after the command echo + timestamp,
    # e.g. "SOFTWARE# 346321-100-ACREATED - 12.02.24.10.05".
    # Some devices pad the software number with spaces before CREATED,
    # e.g. "SOFTWARE# 346020-100-D  CREATED - 01.12.17.15.01"
    def initialize(data)
      software = data[/SOFTWARE#\s*(\S+?)\s*(?=CREATED)/, 1]
      @software_number = software

      if software && (parts = software.split("-")).size >= 3
        @base_number = parts[0]
        @version = parts[1]
        @revision = parts[2..].join("-")
      end

      created = data[/CREATED -\s*([\d.]+)/, 1]
      @created_at = parse_created(created) if created
    end

    private

    # YY.MM.DD.HH.mm
    def parse_created(string)
      yy, mm, dd, hh, min = string.split(".").map(&:to_i)
      year = yy.between?(80, 99) ? 1900 + yy : 2000 + yy
      DateTime.new(year, mm, dd, hh, min)
    rescue ArgumentError
      nil
    end
  end
end
