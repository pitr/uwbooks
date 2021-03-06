class AddIndices < ActiveRecord::Migration
  def self.up
    add_index :books, :created_at
    add_index :users, :email
    add_index :users, :persistence_token
    add_index :users, :last_request_at
  end

  def self.down
    remove_index :users, :last_request_at
    remove_index :users, :persistence_token
    remove_index :users, :email
    remove_index :books, :created_at
  end
end