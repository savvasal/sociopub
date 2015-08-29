class EntriesController < ApplicationController
<<<<<<< HEAD
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
  
=======
  def index
    @entries = Entry.paginate(page: params[:page])
  end

  def destroy
    
  end
>>>>>>> 33d0173cfd79df6567b76997b2b01b34b8f68d70
end
