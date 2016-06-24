require 'spec_helper'

describe Item do
  before :each do
    @item = Item.new('Grow a beard', Time.new(2016))
  end

  describe '#new' do
    it 'should take a time and a name as parameters and return an Item object' do
      expect(@item).to be_an_instance_of Item
    end
  end

  describe '#stringify' do
    it 'should return a readable version of the item' do
      expect(@item.stringify).to eq "Item: Grow a beard @ #{Time.new(2016)}"
    end
  end
end
