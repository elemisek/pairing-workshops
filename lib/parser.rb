# frozen_string_literal: true

require_relative 'file_loader'
require_relative 'counter'
require_relative 'formatters/base'
require_relative 'formatters/total'
require_relative 'formatters/unique'

class Parser
  def initialize(filepath, order = :total)
    @filepath = filepath
    @order = order
  end

  def call
    content = FileLoader.new(filepath).call
    grouped_results = Counter.new(content).public_send(order)
    Kernel.const_get("Formatters::#{order.capitalize}").new(grouped_results).call
  end

  private

  attr_reader :filepath, :order
end
