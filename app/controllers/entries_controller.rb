class EntriesController < ApplicationController
  before_action :admin_user, only: [:edit, :update]
  def index
    @entries = Entry.paginate(page: params[:page])
  end

  def destroy    
  end
  
end
