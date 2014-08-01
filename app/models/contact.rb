class Contact < ActiveRecord::Base
	validates :name,:email,:message,presence:true
    validates :email,format: {with:   /[A-Za-z0-9._]*\@[A-Za-z]*\.[A-Za-z]{2,5}/,message: "Enter a valid email"}
    validates :name,length:{in: 3..30,message:"Not a name"}
    validates :name,format: {with: /\A[a-zA-Z]+\z/,message: 'Only letters'}
    validates :message,length:{in:6..100}
end
