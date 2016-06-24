require 'spec_helper'

describe Todo do
  before :each do
    @todo = Todo.new('todolist.txt')
  end

  describe '#new' do
    it 'should take a file name as a parameter and return a Todo object' do
      expect(@todo).to be_an_instance_of Todo
    end
  end

  describe '#add' do
    it 'should create and add the specified item to the items array and the text file' do
      items = [['Grow a beard', Time.new(2016)], ['Eat some cake', Time.new(2016)]]
      items.each do |item|
        @todo.add(item[0], item[1])
      end
      expect(@todo.to_s).to eq "Item: Grow a beard @ 2016-01-01 00:00:00 -0500\nItem: Eat some cake @ 2016-01-01 00:00:00 -0500\n"

      contents = File.read('todolist.txt')
      expect(contents).to eq "Item: Grow a beard @ 2016-01-01 00:00:00 -0500\nItem: Eat some cake @ 2016-01-01 00:00:00 -0500\n"
    end
  end

  describe '#remove' do
    it 'should remove an item from the items list at the specified index and update the text file' do
      items = [['Grow a beard', Time.new(2016)], ['Eat some cake', Time.new(2016)], ['filler', Time.new(2016)]]
      items.each do |item|
        @todo.add(item[0], item[1])
      end
      expect{ @todo.remove(1) }.to output("Removing Item: Eat some cake @ 2016-01-01 00:00:00 -0500\n").to_stdout
      expect(@todo.to_s).to eq "Item: Grow a beard @ 2016-01-01 00:00:00 -0500\nItem: filler @ 2016-01-01 00:00:00 -0500\n"

      contents = File.read('todolist.txt')
      expect(contents).to eq "Item: Grow a beard @ 2016-01-01 00:00:00 -0500\nItem: filler @ 2016-01-01 00:00:00 -0500\n"
    end
  end

  describe '#clear' do
    it 'should remove all items from the list and clear the text file' do
      items = [['Grow a beard', Time.new(2016)], ['Eat some cake', Time.new(2016)]]
      items.each do |item|
        @todo.add(item[0], item[1])
      end
      expect{ @todo.clear }.to output("Clearing out all items in list\n").to_stdout
      expect(@todo.to_s).to eq ""

      contents = File.read('todolist.txt')
      expect(contents).to eq ""
    end
  end

end
