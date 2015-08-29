class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
<<<<<<< HEAD

  before_action :set_locale
=======
  before_action :set_locale

>>>>>>> 33d0173cfd79df6567b76997b2b01b34b8f68d70
  def set_locale
    I18n.locale = params[:locale] ||
                  I18n.default_locale
  end
<<<<<<< HEAD

  # ελέγχει εάν ο χρήστης είναι συνδεδεμένος - repetition at users_controller
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Παρακαλώ συνδεθείτε."
      redirect_to login_url
    end
  end
  
  # ελέγχει εάν ο χρήστης είναι admin
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
  
  
  before_action do
    if current_user && current_user.admin? && Rails.env == "development"
      Rack::MiniProfiler.authorize_request
    end
  end
=======
  

>>>>>>> 33d0173cfd79df6567b76997b2b01b34b8f68d70
end
