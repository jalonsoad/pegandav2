class ContactController < ApplicationController

	def new
    @contact = Contact.new
  end

  def create
  	puts "in create"
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:error] = nil
      flash.now[:notice] = 'Thank you for your message!'
    else
      flash.now[:error] = 'Cannot send message.'
      render :new
    end
  end


  def send_mail
  	 email = params[:email]
    ContactMailer.contact_email(email).deliver_now
    redirect_to root_path, notice: 'Message sent'

  end

  def new_contact
	name = params[:contact][:name]
  	email = params[:contact][:email]
  	yourmessage = params[:contact][:message]
    ContactMailer.new_contact(name, email, yourmessage).deliver_now
    redirect_to '/#faq', notice: 'Message sent, thank you so much. We´ll contact your shortly'

  end

end
