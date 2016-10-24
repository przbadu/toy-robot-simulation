require 'spec_helper'

describe Table do

  context '.Default' do
    let(:table) { Table.new }

    it 'has minimum x co-ordinate of 0'
    it 'has minimum y co-ordinate of 0'
    it 'has maximum x co-ordinate of 5'
    it 'has maximum y co-ordinate of 5'
  end

  context 'with 4x4 table size' do
    let(:table) { Table.new(4, 4) }

    it 'has minimum x co-ordinate of 0'
    it 'has minimum y co-ordinate of 0'
    it 'has maximum x co-ordinate of 4'
    it 'has maximum y co-ordinate of 4'
  end
end