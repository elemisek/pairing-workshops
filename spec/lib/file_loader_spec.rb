# frozen_string_literal: true

RSpec.describe FileLoader do
  describe '#call' do
    subject { described_class.new(filepath).call }

    let(:filepath) { 'spec/fixtures/page_views.log' }

    it 'splits up lines by whitespace' do
      expect(subject).to include(['/index', '000.111.222.333'])
    end
  end
end
