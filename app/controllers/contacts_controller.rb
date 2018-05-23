class ContactsController < ApplicationController

	def index

		@type_work = Contact.select(:type_work).map(&:type_work).uniq
		@seniority = Contact.select(:seniority).map(&:seniority).uniq
		@location = Contact.select(:location).map(&:location).uniq

	    if current_user

	    	tw = params[:type_work]
	    	sr = params[:seniority]
	    	lt = params[:location]

	    	if (tw && sr && lt) 
			    @contact_entries = Contact.where(type_work:tw).where(seniority:sr).where(location:lt)
			elsif (tw && sr) 
			    @contact_entries = Contact.where(type_work:tw).where(seniority:sr)
			elsif (tw && lt) 
			    @contact_entries = Contact.where(type_work:tw).where(location:lt)
			elsif (sr && lt) 
			    @contact_entries = Contact.where(seniority:sr).where(location:lt)
			elsif (tw) 
			    @contact_entries = Contact.where(type_work:tw)
			elsif (sr) 
			    @contact_entries = Contact.where(seniority:sr)
			elsif (lt) 
			    @contact_entries = Contact.where(location:lt)
			else
			    @contact_entries = Contact.all 
	    	end

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
	    @contact_entries = Contact.new(params.require(:contact).permit(:name, :seniority, :type_work, :location, :specialty, :linkedin, :added_by))

	    respond_to do |format|
	      if @contact_entries.save
	        format.html { redirect_to contacts_path, alert: 'The new marketer was successfully added' }
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
      		if @contact_entries.update(params.require(:contact).permit(:name, :seniority, :type_work, :location, :specialty, :linkedin, :added_by))
        		format.html { redirect_to contact_path, alert: 'The record was successfully updated.' }
      		else
        		format.html { render :edit }
      		end
    	end
  	end

end
