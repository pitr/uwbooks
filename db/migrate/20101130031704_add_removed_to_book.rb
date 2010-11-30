class AddRemovedToBook < ActiveRecord::Migration
  def self.up
    add_column :books, :removed, :boolean, :default => false
  end

  def self.down
    remove_column :books, :removed
  end
end
