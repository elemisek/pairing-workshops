# frozen_string_literal: true

RSpec.describe Counter do
  let(:content) do
    [%w[/index same],
     %w[/index same],
     %w[/index other],
     %w[/about same],
     %w[/about other]]
  end

  describe '#total' do
    subject { described_class.new(content).total }
    let(:result) { [{ url: '/index', occurrences: 3 }, { url: '/about', occurrences: 2 }] }

    it 'returns total occurrences' do
      expect(subject).to eq(result)
    end
  end

  describe '#unique' do
    subject { described_class.new(content).unique }
    let(:result) { [{ url: '/index', occurrences: 2 }, { url: '/about', occurrences: 2 }] }

    it 'returns unique occurrences' do
      expect(subject).to eq(result)
    end
  end
end
