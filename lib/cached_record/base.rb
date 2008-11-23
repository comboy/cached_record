module CachedRecord
  class Base < ::ActiveRecord::Base

    def self.cache
      @cache ||= ::CACHE
    end

    def self.cache=(cache)
      @cache = cache
    end

    self.abstract_class = true
  end
  
end