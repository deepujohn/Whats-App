class UserMailer < ActionMailer::Base
  default from: "deepujohn.ideology@gmail.com"
  def contact(user)
    @user=user
    @to="deepujohn.ideology@gmail.com"
    @url='http://WhatsApp.com/contact'
    mail(to: @to,subject: 'A Message From WhatsApp Contact')
  end  
  def career(user)
  	@user=user
  	@to="deepujohn.ideology@gmail.com"
  	@url='http://ideologysoft.com'
  	attachments['resume']=@user.resume
  	attachments['photo']=@user.photo
  	mail(to: @to,subject: 'Application for Job')  	
  end
end