# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

User.delete_all
Book.delete_all # all books should be deleted already

user = User.create(:email => 'pitr.vern@gmail.com', :password => 'testtest')

100.times {|i| user.books.create(:author => 'Some Author', :title => i.to_s, :price => 99.99, :created_at => (Time.now + i.minutes)) }