# frozen_string_literal: true

class CustomSet
  attr_reader :elements

  def initialize(arr = [])
    @elements = arr
    data_cleaning
  end

  def empty?
    @elements.size.zero?
  end

  def contains?(element)
    @elements.include?(element)
  end

  def subset?(custom_set)
    elements.all? { |element| custom_set.contains?(element) }
  end

  def disjoint?(custom_set)
    elements.none? { |element| custom_set.contains?(element) }
  end

  def eql?(other)
    other.elements.eql?(elements)
  end

  def add(element)
    @elements << element
    data_cleaning

    self
  end

  def intersection(other)
    intersection = @elements.select do |element|
      other.contains?(element)
    end

    CustomSet.new(intersection)
  end

  def difference(other)
    difference = @elements.reject do |element|
      other.contains?(element)
    end

    CustomSet.new(difference)
  end

  def union(other)
    CustomSet.new(@elements + other.elements)
  end

  def ==(other)
    eql?(other)
  end

  private

  def data_cleaning
    @elements.uniq!
    @elements.sort!
  end
end

# p CustomSet.new.empty?
