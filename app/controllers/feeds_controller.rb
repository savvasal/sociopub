class FeedsController < ApplicationController

  def index
    @feeds = Feed.paginate(page: params[:page])
  end
  
  def new
    @feed = Feed.new
  end

  def create
    # να παίρνει το τίτλο από την πηγή
    @feed = Feed.new(feed_params)
    if @feed.save
      flash[:info] = "Η ροή καταχωρήθηκε με επιτυχία."
      redirect_to feeds_path
    else
      render 'new'
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

  def fetch
  end
  
  private

  def feed_params
    params.require(:feed).permit(:title, :url)
  end

end
