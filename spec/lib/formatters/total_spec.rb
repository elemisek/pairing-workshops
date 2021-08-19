# frozen_string_literal: true

RSpec.describe Formatters::Total do
  describe '#call' do
    subject { described_class.new(results).call }

    let(:results) do
      [
        { occurrences: 4, url: '/about' },
        { occurrences: 2, url: '/index' }
      ]
    end

    it do
      expect { subject }.to output(
        <<~TEXT
          /about 4 views
          /index 2 views
        TEXT
      ).to_stdout
    end
  end
end
