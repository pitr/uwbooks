class Book < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :author

  validate :isbn_is_valid

  default_scope order('created_at DESC').where(:removed => false)

  def isbn_is_valid
    true
  end

  def owned_by(a_user)
    user == a_user
  end
end
