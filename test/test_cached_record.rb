require 'test/environment'
require 'test/unit'

class CachedRecordTest < Test::Unit::TestCase
  
  include CachedRecord::TestHelper
  
  def setup
    CachedRecord::TestEnvironment.setup
  end
  
  def test_base
   assert User.find_by_id(1)   
   assert OriginalUser.find_by_id(1)
  end
  
  def test_something
    assert true
  end
  
  def test_blah
    assert true
  end
  
  def test_invalitading_on_save
    assert true
  end
end

