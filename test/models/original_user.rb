# Used for directly accessing database

class OriginalUser < ActiveRecord::Base
  self.table_name = 'users'
end