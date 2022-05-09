# frozen_string_literal: true

module Atg
  class Response < Base
    attr_accessor :command, :entries, :responded_at
    def initialize(data, type:)
      response, checksum = data.split("&&")

      @command = response[0..5]
      @responded_at = parse_timestamp(response[6..15])
      puts "Responded at: #{@responded_at}"

      entry_length = type::ENTRY_LENGTH
      entry_start_position = type::ENTRY_START_POSITION
      entry_data = response[entry_start_position..(response.size - 1)]
      raw_entries = entry_data.scan(/.{#{entry_length}}/)
      puts raw_entries
      @entries = raw_entries.map { type.new(_1) }

      @entries.each do |entry|
        puts entry.inspect
      end
    end
  end
end
