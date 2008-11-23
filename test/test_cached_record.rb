require 'test/environment'
require 'test/unit'

class CachedRecordTest < Test::Unit::TestCase
  
  def setup
    CachedRecord::TestEnvironment.setup
  end
  
  def test_something
    assert true
  end
  
  def test_blah
    assert true
  end
end
