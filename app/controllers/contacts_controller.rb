class ContactsController < ApplicationController

	def index
	    @contact_entries = Contact.all
	end

	def show
	    @contact_entries = Contact.find(params[:id])
	end

	def new
		@contact_entries = Contact.new 
	end

	def create
	    @contact_entries = Contact.new(params.require(:contact).permit(:name, :seniority, :type_work, :location, :linkedin, :added_by))
	    respond_to do |format|
	      if @contact_entries.save
	        format.html { redirect_to contacts_path, notice: 'The new marketer was successfully added' }
	      else
	        format.html { render :new }
	      end
	    end
	end

end
