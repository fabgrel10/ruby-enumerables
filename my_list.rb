class MyList
  def initialize(*list)
    @list = list
  end

  def my_each
    puts @list.to_s
  end
end

example1 = MyList.new(1, 2, 3, 4, 5)
example1.my_each
