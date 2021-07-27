# frozen_string_literal: true

module Formatters
  class Base
    def initialize(grouped_results)
      @grouped_results = grouped_results
    end

    def call
      grouped_results.map do |hash|
        puts compose(hash[:url], hash[:occurrences])
      end
    end

    private

    attr_reader :grouped_results

    def compose(url, visits_count)
      raise NotImplementedError
    end
  end
end
