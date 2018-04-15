class ContactsController < ApplicationController
	def index
	    @contact_entries = Contact.all
	end
	def show
	    @contact_entries = Contact.find(params[:id])
	end
end
