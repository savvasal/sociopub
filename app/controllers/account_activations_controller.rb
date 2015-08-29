class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.update_attribute(:activated, true)
      user.update_attribute(:activated_at, Time.zone.now)
      log_in user
      flash[:success] = "Ο λογαριασμός ενεργοποιήθηκε"
      redirect_to user
    else
      flash[:danger] = "Άκυρος υπερσύνδεσμος"
      redirect_to root_url
    end
<<<<<<< HEAD
  end 
=======
  end
>>>>>>> 33d0173cfd79df6567b76997b2b01b34b8f68d70
end
