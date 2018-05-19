class UsersController < ApplicationController

  def show
  	@users = User.find(params[:id])
  	@contacts = Contact.where(added_by:params[:id])
  end

end
