require_relative "./array"
require 'minitest/autorun'

class MyArrayTest < Minitest::Test
  def setup
    @array = Array.new([1, 2, 3, 4])
    @empty_array = Array.new([])
  end

  def test_cycle
    result = []
    @array.cycle(2) { |x| result << x }
    assert_equal [1, 2, 3, 4, 1, 2, 3, 4], result
  end

  def test_each_slice
    result = []
    @array.each_slice(2) { |slice| result << slice }
    assert_equal [[1, 2], [3, 4]], result
  end

  def test_inject
    result = @array.inject(0) { |sum, x| sum + x }
    assert_equal 10, result
  end

  def test_max_by
    result = @array.max_by { |x| x }
    assert_equal 4, result
  end

  def test_reject
    result = @array.reject { |x| x.even? }
    assert_equal [1, 3], result
  end

  def test_sort_by
    result = @array.sort_by { |x| -x }
    assert_equal [4, 3, 2, 1], result
  end
end