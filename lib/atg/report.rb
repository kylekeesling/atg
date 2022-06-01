# frozen_string_literal: true

module Atg
  class Report < Base
    def self.run(**options)
      options[:code] = code
      options[:response_object] = response_object
      options[:data_field] ||= default_data_field

      command = Command.new(**options)
      command.issue!
    end

    private

    def self.code
      # override in subclasses
    end

    def self.response_object
      # override in subclasses
    end

    def self.default_data_field
      # override in subclasses if needed
    end
  end
end
