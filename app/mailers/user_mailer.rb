class UserMailer < ApplicationMailer
  default from: 'Your Bookshelf Inc. <klchnkvv@gmail.com>'

  def registration_confirmation(user)
    @user = user
    mail to: "#{user.email}>", :subject => "Confirm your registration in 'Your Bookshelf Inc.'"
  end
end
