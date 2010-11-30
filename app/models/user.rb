class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.require_password_confirmation = false
  end

  has_many :books, :dependent => :destroy

  accepts_nested_attributes_for :books
end
