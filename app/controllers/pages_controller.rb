class PagesController < ApplicationController
  def index
  	@contact_entries = Contact.all
  end
end
