module CachedRecord
  class Base < ::ActiveRecord::Base
  end

  def self.cache
    @cache ||= ::CACHE
  end
  
  def self.cache=(cache)
    @cache = cache
  end
  
end