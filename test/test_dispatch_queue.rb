require 'test/unit'
require 'dispatch_queue'

class DispatchQueueTest < Test::Unit::TestCase
  def test_DQ_is_equal_toDispatchQueue
    assert_equal DQ, DispatchQueue
  end

  def test_it_yield_results
    assert_equal [3,4], DQ[lambda{ sleep 0.1; 4}, lambda{ 3}].sort
  end

  def test_it_is_enumerable
    assert DQ.included_modules.include?(Enumerable)
  end
end
