class Book < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :author

  validate :isbn_is_valid

  def isbn_is_valid
    true
  end

  def owned_by(user)
    user.exists?(id)
  end
end
