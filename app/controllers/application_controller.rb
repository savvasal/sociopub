class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :set_locale
  def set_locale
    I18n.locale = params[:locale] ||
                  I18n.default_locale
  end
  
  
  before_action do
    if current_user && current_user.admin?
      Rack::MiniProfiler.authorize_request
    end
  end
end
