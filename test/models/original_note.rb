# Used for directy accessing database

class OriginalNote < ActiveRecord::Base
  self.table_name = 'notes'
  
  belongs_to :user
  
end