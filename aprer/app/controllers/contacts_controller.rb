class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Merci de votre message. Nous vous recontacterons ultérieurement!'
      redirect_to new_contact_path
      #render :new
    else
      flash.now[:error] = 'Message non envoyé. Veuillez réessayez !'
      redirect_to new_contact_path
      #render :new
    end
  end
end
