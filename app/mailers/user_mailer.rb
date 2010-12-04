class UserMailer < ActionMailer::Base
  default :from => "pitr.vern@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup.subject
  #
  def signup(user)
    mail :to => user.email, :subject => 'Welcome to uwbooks.ca!'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.contact.subject
  #
  def contact(from, to, book)
    mail :to => to.email, :subject => "#{from.email} would like to buy #{book.title}", :return_path => from.email
  end
end
