module Atg
  class Report < Base
    attr_accessor :responded_at, :raw_data

    UNRECOGNIZED_RESPONSE_CODE = "9999FF1B"

    def initialize(adapter: nil)
      @adapter = adapter
    end

    def run(data_field: nil)
      command_string = [SOH, command_code, data_field].reject(&:nil?).join

      response_string = @adapter.write(command_string)

      process(response_string)
    end

    def command_code
      "replace in subclass"
    end

    def result_object
      "replace in subclass"
    end

    def result_length
      "replace in subclass"
    end

    # most resports default to 16,
    # the 6 character command string and 10 digit datestamp
    # which take up positions 0..15
    def results_start_position
      16
    end

    private

    def process(data)
      @raw_data = data
      @response, _checksum = data.split("&&")
      @response.delete!(SOH)
      @response.delete!(EXT)

      @response_command = @response[0..5]
      validate!
      @responded_at = parse_timestamp(@response[6..15])

      parse_response_results

      # rescue
      #   raise InvalidResponseError.new("invalid response for command (#{command_code}) - '#{data}'")
    end

    # In most cases this method will break @response into the proper
    # objects but it scenarios where it doesn't it can be overridden
    # in the report subclass to properly handle resultsm just make sure
    # that the method returns the result objects
    def parse_response_results
      results_data = @response[results_start_position..(@response.size - 1)]
      raw_results = results_data.scan(/.{#{result_length}}/)

      raw_results.map { result_object.new(_1) }
    end

    def validate!
      validate_that_command_code_is_recognized
      verify_response_code_matches_issued_command
    end

    def verify_response_code_matches_issued_command
      if command_code != @response_command
        raise InvalidResponseError.new(
          "response code (#{@response_command}) does not match issued code (#{command_code})"
        )
      end
    end

    def validate_that_command_code_is_recognized
      if @response.include?(UNRECOGNIZED_RESPONSE_CODE)
        raise CommandNotRecognizedError.new("'#{command_code}' is not a recognized command")
      end
    end
  end
end
