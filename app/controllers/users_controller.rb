class UsersController < ApplicationController

  def show
  	@users = User.find(params[:id])
  	@contacts = Contact.find_by_added_by(:id)
  end

end
