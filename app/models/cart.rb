class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || Hash.new(0)
  end

  def add_accessory(id)
    @contents[id] = @contents[id] ||= 0
    @contents[id] = @contents[id] + 1
  end

  def subtract_accessory(id)
    @contents[id] = @contents[id] - 1
  end

  def count_of(id)
    @contents[id].to_i
  end

  def total_count
    @contents.values.sum
  end

  def format
    formatted_hash = {}
    @contents.each do |item_id, count|
      item = Accessory.find(item_id.to_i)
      formatted_hash[item] = {'count' => count, 'subtotal' => (item.price * count)}
    end
    formatted_hash
  end

  def cart_total
    format.values.inject(0) do |init, hash|
      init += hash['subtotal']
    end
  end
end
