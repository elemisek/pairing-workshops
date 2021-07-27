# frozen_string_literal: true

RSpec.describe Formatters::Unique do
  describe '#call' do
    subject { described_class.new(results).call }

    let(:results) do
      [
        { occurrences: 4, url: '/about' },
        { occurrences: 2, url: '/index' }
      ]
    end
  end
end
