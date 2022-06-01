# frozen_string_literal: true

module Atg
  class TankLeakTestResultsReport < Report
    def command_code
      "i20800"
    end

    def result_object
      TankLeakTestHistoryRecord
    end

    def parse_response_results
      results_data = @response[results_start_position..(@response.size - 1)]
      results_length = results_data.length
      final_cursor_position = results_length - 1

      cursor = 0

      results = []

      while cursor <= final_cursor_position

        tank_number = results_data[cursor..(cursor += 1)]
        results_to_follow = results_data[(cursor += 1)..(cursor += 1)].to_i(16)

        result_character_count = 40
        end_of_results_character_count = results_to_follow * result_character_count

        tank_results_block = results_data[(cursor += 1)..(cursor += end_of_results_character_count)]
        tank_results = tank_results_block.scan(/.{#{result_character_count}}/)

        tank_results.each do |result|
          result_string = [tank_number, result].join
          results << TankLeakTestResult.new(result_string)
        end
      end

      results
    end
  end
end
