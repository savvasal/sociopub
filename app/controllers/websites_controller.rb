class WebsitesController < ApplicationController
  def index
    @websites =  Website.paginate(page: params[:page])
  end

  def update
    @website = Website.find(params[:id]) 
    if @website.update_attribute(:compatible, params[:compatible])
      flash[:success] = "Το χαρακτηριστικό της σελίδας έχει ανανεωθεί."
      redirect_to websites_path
    else
      flash[:success] = "Κάτι πήγε λάθος"
      redirect_to websites_path
    end
  end
end
