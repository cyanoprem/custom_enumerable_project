module Enumerable
  # Your code goes here
  def my_each_with_index
    count = 0
    while count < self.length
      yield(self[count], count)
      count += 1
    end
    self
  end

  def my_select
    array = []
    self.my_each do |element|
      array << element if yield(element)
    end
    array
  end

  def my_all?
    value = true
    self.my_each do |element|
      value = false unless yield(element)
    end
    value
  end

  def my_none?
    value = true
    self.my_each do |element|
      value = false if yield(element)
    end
    value
  end

  def my_count
    return self.length unless block_given?

    count = 0
    self.my_each do |element|
      count += 1 if yield(element)
    end
    count
  end

  def my_map
    array = []
    self.my_each do |element|
      array << yield(element)
    end
    array
  end

  def my_inject(arg)
    acc = arg
    self.my_each do |element|
      acc = yield(acc, element)
    end
    acc
  end
  
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    count = 0
    while count < self.length
      yield(self[count])
      count += 1
    end
    self
  end
end
