class Book < ActiveRecord::Base
  belongs_to :user

  validates_numericality_of :price
  validates_presence_of :author
  validates_presence_of :title

  validate :isbn_is_valid

  default_scope order('created_at DESC').where(:removed => false)

  def isbn_is_valid
    # TODO: actually check
    true
  end

  def owned_by(a_user)
    user == a_user
  end
end
