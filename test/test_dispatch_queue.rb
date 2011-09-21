require 'test/unit'
require 'dispatch_queue'

class DispatchQueueTest < Test::Unit::TestCase
  def test_DQ_is_equal_toDispatchQueue
    assert_equal DQ, DispatchQueue
  end

  def test_it_yield_results
    assert_equal [3,4], DQ[lambda{ sleep 0.1; 4}, lambda{ 3}].sort
  end

  def test_threaded_each
    results = []

    [1,2,3].threaded_each { |value|
      value *= 2
      Thread.exclusive{ results << value }
    }

    assert_equal [2,4,6], results.sort
  end

  def test_threaded_map
    assert_equal [2,4,6], [1,2,3].threaded_map{|a| a*2}
  end

end
