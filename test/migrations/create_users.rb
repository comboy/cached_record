class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name, :login
      t.integer :age
      t.boolean :is_active
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
