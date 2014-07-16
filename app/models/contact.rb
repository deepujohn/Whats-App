class Contact < ActiveRecord::Base
	validates :name,:email,:message,presence:true
    validates :email,format: {with:   /[A-Za-z0-9._]*\@[A-Za-z]*\.[A-Za-z]{2,5}/,message: "Enter a valid email"}
end
