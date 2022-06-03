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

      @results_data = @response[results_start_position..(@response.size - 1)]
      @cursor = 0
      @results = []

      parse_response_results
    rescue
      raise InvalidResponseError.new("invalid response for command (#{command_code}) - '#{data}'")
    end

    # In most cases this method will break @results_data into the proper
    # objects but it scenarios where it doesn't it can be overridden
    # in the report subclass to properly handle results, just make sure
    # that the method returns the result objects as an array
    def parse_response_results
      raw_results = @results_data.scan(/.{#{result_length}}/)
      raw_results.map { result_object.new(_1) }
    end

    def parse_repeating_result_block(result_length:, results_to_follow:, prepend_to_result: nil)
      end_of_results_character_count = results_to_follow * result_length
      final_cursor_position = @cursor + end_of_results_character_count

      while @cursor <= final_cursor_position
        results_block = @results_data[(@cursor += 1)..(@cursor += end_of_results_character_count)]
        results_array = results_block.scan(/.{#{result_length}}/)

        results_array.each do |result|
          result_string = [prepend_to_result, result].reject(&:nil?).join
          @results << result_object.new(result_string)
        end
      end
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
