class EntriesController < ApplicationController

  before_action :admin_user, only: [:edit, :update]
  def index
    @entries = Entry.paginate(page: params[:page], :per_page => 9)
  end

  #
  #
  #
  def create

  end
  
  def destroy    
  end
  
end
