require 'lib/cached_record'
require 'pp'


module CachedRecord
  
  class Base
    def self.find_by_sql(sql)
      # Not so nice solution, just like global variable,
      # but that's just testing that will always run on one thread
      ::CachedRecord::TestEnvironment.last_query_time = Time.now
      super
    end
  end
  
  class TestEnvironment
   
    #class << self    
    cattr_accessor :last_query_time
    
    
    def self.db_file
      "test/tmp/test.db"
    end
    
    def self.establish_connection
      ActiveRecord::Base.configurations = {
        'test_db' => {
          :adapter  => 'sqlite3',
          :database => db_file,
          :timeout => 5000
        },
        'empty' => {
          :adapter  => 'sqlite3',
          :database => ':memory:',
          :timeout => 5000
        }                
      }
      ActiveRecord::Base.establish_connection 'test_db'      
    end
    
    def self.setup_db      
      Dir.glob('test/migrations/*.rb').each { |f| require f }
      File.unlink db_file if File.exists? db_file
      setup
      CreateUsers.up      
      load_fixture :users
    end
    
    def self.load_fixture(name)
      klass = name.to_s.classify.constantize
      fixture = YAML.load_file("test/fixtures/#{name}.yml")
      fixture.each do |row|
        klass.create row
      end
    end
    
    def self.setup
      ::CachedRecord.cache_store = MemCache.new :namespace => (rand(9999999).to_s(36)+Time.now.to_i.to_s)
      ::CachedRecord.cache_store.servers = 'localhost:11211'
    end
    
    def self.prepare
      establish_connection
      Dir.glob('test/models/*.rb').each { |f| require f }            
    end 
   
  end
  
  module TestHelper
    def without_db
      ActiveRecord::Base.establish_connection nil
      yield
      establish_connection
    end
    
    def assert_no_query
      ::CachedRecord::TestEnvironment.last_query_time = nil
      yield
      assert !::CachedRecord::TestEnvironment.last_query_time, "Database called when cache should be used"
    end
    
  end
end