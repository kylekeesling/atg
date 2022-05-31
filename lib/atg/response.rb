# frozen_string_literal: true

module Atg
  class Response < Base
    attr_accessor :raw_data, :response, :entries, :responded_at

    UNRECOGNIZED_RESPONSE_CODE = "9999FF1B"

    def initialize(data, report:)
      @raw_data = data
      @response, _checksum = data.split("&&")

      @response.delete!(SOH)
      @response.delete!(EXT)
      @command = @response[0..5]

      @report = report
      @code = @report.code
      @response_object_type = @report.response_object

      validate!

      @responded_at = parse_timestamp(@response[6..15])

      entry_length = @report::ENTRY_LENGTH
      entry_start_position = @report::ENTRY_START_POSITION
      entry_data = @response[entry_start_position..(@response.size - 1)]
      raw_entries = entry_data.scan(/.{#{entry_length}}/)

      @entries = raw_entries.map { @response_object_type.new(_1) }
      # rescue
      #   raise InvalidResponseError.new("invalid response for command (#{@code}) - '#{data}'")
    end

    private

    def validate!
      validate_response_code
      verify_response_code
    end

    def verify_response_code
      if @code != @command
        raise InvalidResponseError.new("response code (#{@command}) does not match issued code (#{@code})")
      end
    end

    def validate_response_code
      if @response.include?(UNRECOGNIZED_RESPONSE_CODE)
        raise CommandNotRecognizedError.new("'#{@code}' is not a recognized command")
      end
    end
  end
end
