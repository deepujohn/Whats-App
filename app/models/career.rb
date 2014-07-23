class Career < ActiveRecord::Base
	mount_uploader :photo,PhotoUploader
	mount_uploader :resume,ResumeUploader
	validates :first_name,:last_name,:city,:email,:phone,:resume,:photo,:country,presence:true
	validates :first_name,format: {with: /\A[a-zA-Z]+\z/,message: 'Only letters'}
	validates :last_name,format: {with: /\A[a-zA-Z]+\z/,message: 'Only letters'}
	validates :city,format: {with: /\A[a-zA-Z ]+\z/,message: 'Only letters'}
	validates :email,format: {with:   /[A-Za-z0-9._]*\@[A-Za-z]*\.[A-Za-z]{2,5}/,message: "Enter a valid email"}
	validates :phone,format: {with: /[0-9]{10,13}/,message: 'Enter your phone number'}
	validates_format_of :photo, :with => %r{\.(png|jpg|jpeg)}i, message:  "Only jpeg,jpg,png allowed"
	validates_format_of :resume, :with => %r{\.(doc|docx|pdf)}i, message: "Only .doc , .docx , .pdf allowed"
end
