class Book < ActiveRecord::Base
  validates_presence_of :author

  validate :isbn_is_valid

  def isbn_is_valid
    true
  end
end
