# frozen_string_literal: true

RSpec.describe FileLoader do
  describe '#call' do
    subject { described_class.new(filepath).call }

    let(:filepath) { 'spec/fixtures/page_views.log' }

    it 'splits up lines by whitespace' do
      expect(subject).to include(%w[/index 000.111.222.333])
    end

    it 'returns correct number of pages' do
      expect(subject.size).to eq(46)
    end
  end
end
