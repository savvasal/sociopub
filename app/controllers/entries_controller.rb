class EntriesController < ApplicationController
  def index
    @entries = Entry.paginate(page: params[:page])
  end

  def destroy
    
  end
end
