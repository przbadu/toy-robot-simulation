require 'rspec'
require 'table'

describe Table do
  context '.Default' do
    let(:table) { Table.new }

    (0..4).each do |pos|
      it { expect(table.x_range === pos).to be_truthy }
      it { expect(table.y_range === pos).to be_truthy}
    end

    it { expect(table.x_range === -1).to be_falsey}
    it { expect(table.x_range === 5).to be_falsey}
    it { expect(table.y_range === -1).to be_falsey}
    it { expect(table.y_range === 5).to be_falsey}
  end

  context 'with 4x4 table size' do
    let(:table) { Table.new(4, 4) }

    (0..3).each do |pos|
      it { expect(table.x_range === pos).to be_truthy }
      it { expect(table.y_range === pos).to be_truthy}
    end

    it { expect(table.x_range === -1).to be_falsey}
    it { expect(table.x_range === 4).to be_falsey}
    it { expect(table.y_range === -1).to be_falsey}
    it { expect(table.y_range === 4).to be_falsey}
  end
end