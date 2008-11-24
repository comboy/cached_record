module CachedRecord
  class Base < ::ActiveRecord::Base
    
    class << self      
      
      def find_one(id,options)
        return super unless options.empty?
        key = "#{self.table_name}::#{id}"
        if value = cache_store.get(key)
        else
          value = super
          cache_store.set(key,value)
        end
        return value
      end
                  
      def cache_store
        @cache_store ||= ::CachedRecord.cache_store
      end
      
    end 
    
    def save(run_validations = true)
      self.class.cache_store.set "#{self.class.table_name}::#{id}", nil
      super
    end
    
    self.abstract_class = true
  end

  def self.cache_store
    @cache_store ||= ::CACHE
  end

  def self.cache_store=(cache)
    @cache_store = cache
  end
  
end