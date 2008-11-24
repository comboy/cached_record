require 'test/environment'
require 'test/unit'


CachedRecord::TestEnvironment.prepare

class CachedRecordTest < Test::Unit::TestCase
  
  include CachedRecord::TestHelper
  
  def setup
    CachedRecord::TestEnvironment.setup
  end
  
  def test_base
   assert u1 = User.find_by_id(1)   
   assert u2 = OriginalUser.find_by_id(1)
   assert u1.name
   assert_equal u1.name,u2.name
  end
  
  def test_caching_for_Find_by_id
    assert user = User.find(1), "could not find user "
    assert_no_query do
      assert user2 = User.find(1), "could not find user second time"
      assert_equal user, user2, "cached user differs from original"
    end
  end
  
  def test_invalidating_on_save
    user = User.find(1)
    name = rand(10**8).to_s(36)
    user.name = name
    user.save    
    u2 = User.find(1)    
    assert_equal name, u2.name
    u3 = OriginalUser.find(1)
    assert_equal name, u3.name
  end
  
  def test_invalidating_on_update_attributes
    user = User.find(1)
    name = rand(10**8).to_s(36)
    user.update_attributes :name => name
    u2 = User.find(1)
    assert_equal name, u2.name    
  end

  def test_invalidating_on_update_attribute
    user = User.find(1)
    name = rand(10**8).to_s(36)
    user.update_attribute(:name,name)
    u2 = User.find(1)
    assert_equal name, u2.name    
  end
  
end

