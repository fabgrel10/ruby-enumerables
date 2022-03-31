# frozen_string_literal: false

require_relative 'my_enumerable'

# MyList: This class has an instance variable @list
class MyList
  include MyEnumerable

  def initialize(*list)
    @list = list
  end

  def each
    @list.each { |x| yield(x) if block_given? }
  end
end

example1 = MyList.new(1, 2, 3, 4)
example1.each { |x| puts x.to_s }
puts example1.all? { |i| i >= 5 }.to_s
puts example1.filter {|e| e.even?}.to_s
