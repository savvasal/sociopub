class FeedsController < ApplicationController
  before_action :admin_user, only: [:edit, :update]
  before_action :logged_in_user, only: [:index, :new, :create]
  def index
    @feeds = Feed.paginate(page: params[:page])
  end
  
  def new
    @feed = Feed.new
  end

  def create
    # να παίρνει το τίτλο από την πηγή
    # @feed = Feed.new(feed_params)
    # if @feed.save
    #  flash[:info] = "Η ροή καταχωρήθηκε με επιτυχία."
    #  redirect_to feeds_path
    #else
    #  render 'new'
    #end
  end

  def edit
    @feed = Feed.find(params[:id])
  end
  
  def update
    @feed = Feed.find(params[:id])
    if @feed.update_attributes(feed_params)
      flash[:success] = "η Αλλαγή έχει γίνει με επιτυχία"
      redirect_to subscriptions_path
    else
      render 'edit'
    end
  end

  def destroy
    #  Feed.find(params[:id]).destroy
    #  flash[:success] = "Ο ροή διαγράφηκε"
    #  redirect_to feeds_url
    # Κανονικά η πιο κάτω ενέργεια είναι δουλειά του subscriptions_controller
    # Έχει μπει εδώ γιατί υπήρχε πρόβλημα στην υλοποίηση 
    Subscription.where(user_id: current_user.id,feed_id: params[:id].to_i).destroy_all
    redirect_to subscriptions_path
    flash[:success] = "Η ροή #{Feed.find(params[:id].to_i).title} έχει διαγραφεί από τις συνδρομές σας"
  end

  
  private

  def feed_params
    params.require(:feed).permit(:title, :url, :compatible)
  end



end
