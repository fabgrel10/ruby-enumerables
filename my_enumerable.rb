# frozen_string_literal: false

# MyEnumerable: My enumerables methods module
module MyEnumerable

  def all?
    flag = true
    each { |item| flag = false unless yield(item) }
    flag
  end

  def any?
    flag = false
    each { |item| flag = true if yield(item) }
    flag
  end

  def filter
    list = []
    each { |item| list.push(item) if yield(item)}
    list
  end
end
