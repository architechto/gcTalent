class ContactsController < ApplicationController

	def index
	    if current_user
		    @contact_entries = Contact.all
		else
	        redirect_to new_user_session_path
		end
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

	def edit
		@contact_entries = Contact.find(params[:id])
	end

	def update
		@contact_entries = Contact.find(params[:id])

    	respond_to do |format|
      		if @contact_entries.update(params.require(:contact).permit(:name, :seniority, :type_work, :location, :linkedin, :added_by))
        		format.html { redirect_to contact_path, notice: 'The record was successfully updated.' }
      		else
        		format.html { render :edit }
      		end
    	end
  	end

end
