# frozen_string_literal: true

RSpec.describe Parser do
  describe '#call' do
    let(:filepath) { 'spec/fixtures/page_views.log' }

    context 'when no order given' do
      subject { described_class.new(filepath).call }

      let(:result) do
        <<~TEXT
          /home 12 views
          /index 9 views
          /about_us 8 views
          /contact 7 views
          /about_us/2 7 views
          /help/1 3 views
        TEXT
      end

      it 'returns logs grouped by total visits descending' do
        expect { subject }.to output(result).to_stdout
      end
    end

    context 'when order as total given' do
      subject { described_class.new(filepath, :total).call }

      let(:result) do
        <<~TEXT
          /home 12 views
          /index 9 views
          /about_us 8 views
          /contact 7 views
          /about_us/2 7 views
          /help/1 3 views
        TEXT
      end

      it 'returns logs grouped by total visits descending' do
        expect { subject }.to output(result).to_stdout
      end
    end

    context 'when order as unique given' do
      subject { described_class.new(filepath, :unique).call }

      let(:result) do
        <<~TEXT
          /home 9 unique views
          /about_us 8 unique views
          /index 8 unique views
          /contact 6 unique views
          /about_us/2 5 unique views
          /help/1 2 unique views
        TEXT
      end

      it 'returns logs grouped by unique visits descending' do
        expect { subject }.to output(result).to_stdout
      end
    end
  end
end
