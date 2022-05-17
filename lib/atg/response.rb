# frozen_string_literal: true

module Atg
  class Response < Base
    attr_accessor :entries, :responded_at

    UNRECOGNIZED_RESPONSE_CODE = "9999FF1B"

    def initialize(data, code:, type:)
      @response, checksum = data.split("&&")

      @response.delete!(SOH)
      @response.delete!(EXT)

      @code = code
      @command = @response[0..5]

      validate!

      @responded_at = parse_timestamp(@response[6..15])
      # puts "Responded at: #{@responded_at.strftime("%Y-%m-%d %H:%M:%S")}"

      entry_length = type::ENTRY_LENGTH
      entry_start_position = type::ENTRY_START_POSITION
      entry_data = @response[entry_start_position..(@response.size - 1)]
      raw_entries = entry_data.scan(/.{#{entry_length}}/)

      @entries = raw_entries.map { type.new(_1) }
      # puts @entries.map { puts _1.inspect }
    end

    private

    def validate!
      validate_response_code && verify_response_code
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
