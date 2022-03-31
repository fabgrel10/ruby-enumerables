# MyEnumerable: My enumerables methods module
module MyEnumerable
  # Public: mimics the behaviour of all? enumerable
  #
  # &block
  #
  # Examples
  #
  #   all? { |n| 5 <= n}
  #   # => true
  #
  # Returns true if the condition is met.
  def all?
    flag = true
    each { |item| flag = false unless yield(item) }
    flag
  end

  # Public: mimics the behaviour of any? enumerable
  #
  # &block
  #
  # Examples
  #
  #   any? { |n| 5 >= n}
  #   # => true
  #
  # Returns true if the condition is met.
  def any?
    flag = false
    each { |item| flag = true if yield(item) }
    flag
  end

  # Public: mimics the behaviour of filter enumerable
  #
  # &block
  #
  # Examples
  #
  #   [1, 2, 3, 4].filter { |n| n.even?}
  #   # => [2, 4]
  #
  # Returns a filtered list.
  def filter
    list = []
    each { |item| list.push(item) if yield(item) }
    list
  end
end
