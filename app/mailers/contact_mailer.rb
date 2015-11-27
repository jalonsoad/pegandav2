class ContactMailer < ApplicationMailer

	 
	   default :to => 'juliocesar.alonso@gmail.com',
        	   :from => "peganda.com <info@peganda.com>" 
              
    def contact_email(email)
        @email = email
        mail(subject: 'Newsletter subscription from the website')
    end



    def new_contact(name, email, yourmessage)

        @name = name
        @email = email
        @yourmessage = yourmessage
        mail(subject: 'Contact Request from the website')
    end


end
