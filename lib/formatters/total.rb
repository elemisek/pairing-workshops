# frozen_string_literal: true

module Formatters
  class Total < Base
    private

    def compose(url, visits_count)
      "#{url} #{visits_count} views"
    end
  end
end
