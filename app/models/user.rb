class User < ActiveRecord::Base
  acts_as_authentic

  has_many :books

  accepts_nested_attributes_for :books
end
