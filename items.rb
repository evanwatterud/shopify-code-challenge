class Item
  attr_reader :name, :time

  def initialize(name, time)
    @name = name
    @time = time
  end

  def stringify
    "Item: #{@name} @ #{@time.to_s}"
  end
end

class Todo
  attr_reader :items, :file_name

  def initialize(file_name)
    :file_name = file_name      ## Initialize with a file name in local directory
    :items = []
  end

  def add(item)
    item = Item.new(item, Time.now)
    @items.push(item)
    File.open(file_name, "w") do |f|
      f.write(to_s)
    end
    items
  end

  def remove(index)
    puts "Removing " + @items[index.to_i - 1].stringify
    @items.delete_at(index.to_i - 1)
    File.open(file_name, "w") do |f|
      f.write(to_s)
    end
    items
  end

  def clear
    puts "Clearing out all items in list"
    @items.clear
    File.open(file_name, "w") do |f|
      f.write(to_s)
    end
    items
  end

  def to_s
    @items.each{ |item| item.stringify }
  end
end
