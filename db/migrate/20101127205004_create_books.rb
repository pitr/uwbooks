class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.string :isbn, :limit => 13
      t.decimal :price, :precision => 5, :scale => 2
      t.string :author, :limit => 255
      t.string :title, :limit => 255
      t.string :course, :limit => 255
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :books
  end
end
