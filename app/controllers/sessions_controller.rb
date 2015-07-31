class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1'? remember(user) : forget(user)
        redirect_back_or user
      else
        message = "Ο Λογαρισμός δεν είναι ενεργοποιημένος. "
        message += "Τσιάκκαρε το email σου, πρέπει να σου ήρτε κάτι."
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
