# frozen_string_literal: true

class Counter
  def initialize(content)
    @content = content
  end

  def total
    content
      .group_by(&:first)
      .map { |url, entries| { url: url, occurrences: entries.size } }
  end

  def unique
    content.group_by(&:first)
  end

  private

  attr_reader :content

  def sort_results(scope)
    scope.sort_by { |hash| hash[:occurrences] }.reverse!
  end
end
