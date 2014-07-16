class UserMailer < ActionMailer::Base
  default from: "deepujohn.ideolkjkjlkjogy@gmail.com"
  def contact(user)
    @user=user
    @to="deepujohn.ideology@gmail.com"
    @url='http://WhatsApp.com/contact'
    mail(to: @to,subject: 'A Message From WhatsApp Contact')
  end
end