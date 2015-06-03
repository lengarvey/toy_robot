require_relative 'spec_helper'
require 'table'

RSpec.describe 'Table' do
  let(:point) { double('Point', x: x, y: y) }
  let(:table) { Table.new }
  let(:x) { 0 }
  let(:y) { 0 }

  describe '#include?' do
    subject { table.include?(point) }

    context 'with a point on the table' do
      let(:x) { 4 }

      it { is_expected.to eq true }
    end

    context 'with a point just off the table' do
      let(:y) { 5 }

      it { is_expected.to eq false }
    end
  end
end
