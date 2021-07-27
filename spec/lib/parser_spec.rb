# frozen_string_literal: true

RSpec.describe Parser do
  describe '#call' do
    let(:filepath) { 'path_to_file' }

    let(:file_loader_output) do
      [['/index', '000.111.222.333'], ['/about_us', '111.222.333.444'], ['/index', '000.111.222.333']]
    end
    let(:file_loader) { instance_double('FileLoader', call: file_loader_output) }

    let(:counter_total_output) { [{ url: '/index', occurrences: 2 }, { url: '/about_us', occurrences: 1 }] }
    let(:counter_unique_output) { [{ url: '/index', occurrences: 1 }, { url: '/about_us', occurrences: 1 }] }
    let(:counter) { instance_double('Counter', total: counter_total_output, unique: counter_unique_output) }

    before do
      expect(FileLoader).to receive(:new).with(filepath).and_return(file_loader)
      expect(Counter).to receive(:new).and_return(counter)
    end

    context 'when no order given' do
      subject { described_class.new(filepath).call }

      it do
        expect { subject }.to output(
          <<~TEXT
            /index 2 views
            /about_us 1 views
          TEXT
        ).to_stdout
      end
    end

    context 'when order as total given' do
      pending
    end

    context 'when order as unique given' do
      pending
    end
  end
end
