
class ContactsController < ApplicationController
    def new
        @contact = Contact.new
    end
    
    
    #POST request/contacts
    def create
        #Mass assignment of form fields into Contact object
        @contact = Contact.new(contact_params)
        #Save the contact object to the database 
        if @contact.save
            #Store form fields via parameter, into variables 
            name = params[:contact][:Name]
            email = params[:contact][:Email]
            body = params[:contact][:Comments]
            #Plug variables into the Contact Mailer -
            # - email method and send email
            ContactMailer.contact_email(name, email, body).deliver
            # Display source success message in flash hash - 
            # - and redirect to the new action 
            flash[:success] = "Message Sent."
            redirect_to new_contact_path
        else
            #If contact object doesnt save - 
            # - store errors in flash hash - 
            # - and redirect to the new action
            flash[:danger] = @contact.errors.full_messages.join(", ")
            redirect_to new_contact_path
        end
    end

private
    #To collect data from form, we need to use - 
    # - strong parameters and whitelist the form fields 
    def contact_params
        params.require(:contact).permit(:Name, :Email, :Comments)
    end
end
