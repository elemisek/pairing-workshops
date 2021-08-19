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
      let(:formatter) { instance_double('Formatter::Total') }

      it do
        expect(counter).to receive(:call).with(:total).and_return(counter_total_output)
        expect(Formatters::Total).to receive(:new).with(counter_total_output).and_return(formatter)
        expect(formatter).to receive(:call)
        subject
      end
    end

    context 'when order as total given' do
      subject { described_class.new(filepath, :total).call }
      let(:formatter) { instance_double('Formatter::Total') }

      it do
        expect(counter).to receive(:call).with(:total).and_return(counter_total_output)
        expect(Formatters::Total).to receive(:new).with(counter_total_output).and_return(formatter)
        expect(formatter).to receive(:call)
        subject
      end
    end

    context 'when order as unique given' do
      subject { described_class.new(filepath, :unique).call }
      let(:formatter) { instance_double('Formatter::Unique') }

      it do
        expect(counter).to receive(:call).with(:unique).and_return(counter_unique_output)
        expect(Formatters::Unique).to receive(:new).with(counter_unique_output).and_return(formatter)
        expect(formatter).to receive(:call)
        subject
      end
    end
  end
end
