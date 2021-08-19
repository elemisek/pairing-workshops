# frozen_string_literal: true

module Formatters
  class Unique < Base
    private

    def compose(url, visits_count)
      "#{url} #{visits_count} unique views"
    end
  end
end
