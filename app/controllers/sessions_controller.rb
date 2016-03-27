class SessionsController < ApplicationController
  
  def new
  end

  def create   
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1'? remember(user) : forget(user)
        redirect_back_or user
      else
        message = "Ο Λογαρισμός δεν είναι ενεργοποιημένος. "
        message += "Έλεγξε το ηλεκτρονικό σου ταχυδρομείο για ενεργοποίηση λογαριασμού."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = "Λάθος όνομα χρήστη/κωδικός."
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
end
