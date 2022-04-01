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
    if block_given?
      each { |n| return false unless yield(n) }
    elsif param.nil?
      each { |n| return false if !n || n.nil? }
    elsif !param.nil? && (param.is_a? Class)
      each { |n| return false unless [n.class, n.class.superclass, n.class.superclass].include?(param) }
    elsif !param.nil? && (param.is_a? Regexp)
      each { |n| return false unless n.match(param) }
    else
      each { |n| return false unless n == param }
    end
    true
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
    if block_given?
      each { |n| return true if yield(n) }
    elsif param.nil?
      each { |n| return true if n }
    elsif !param.nil? && (param.is_a? Class)
      each { |n| return true if [n.class, n.class.superclass, n.class.superclass].include?(param) }
    elsif !param.nil? && (param.is_a? Regexp)
      each { |n| return true if n.match(param) }
    else
      each { |n| return true if n == param }
    end
    false
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
