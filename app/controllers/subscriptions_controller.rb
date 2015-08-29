class SubscriptionsController < ApplicationController
<<<<<<< HEAD
  before_action :logged_in_user, only: [:index, :show, :new, :edit, :destroy]
  include SubscriptionsHelper
  
=======
 
>>>>>>> 33d0173cfd79df6567b76997b2b01b34b8f68d70
  def index
    # Να αλλάξει
    # @subscriptions = Subscription.paginate(page: params[:page])
    # @feed = Feed.new
    # @subscription = Subscription.new
<<<<<<< HEAD
    @feeds = Feed.paginate(page: params[:page])
=======
>>>>>>> 33d0173cfd79df6567b76997b2b01b34b8f68d70
  end
  
  def show
    @subscription = Subscription.find(params[:user_id])
  end
  
  def new
    @feed = Feed.new
  end
  
  def create
<<<<<<< HEAD
    if uri?(params[:subscription][:url])
      # Αν δεν υπάρχει η ροή στη βάση να τη δημιουργεί
      # Κανονικά πρέπει να πάει στο create feed για να εφαρμόζεται το validate
      feed = Feed.find_or_initialize_by(url: params[:subscription][:url])
      if feed.new_record?
        # δαμέ αρκεί - αφού κάμει τη δουλειά μπορεί να τα φυλάει και για μετά
        xml = Feedjira::Feed.fetch_and_parse params[:subscription][:url] 
        feed.title = xml.title 
        feed.save
      end
      Subscription.find_or_create_by(user_id: current_user.id, feed_id: feed.id )    
      redirect_to subscriptions_path
      # flash message
      flash[:success] = "Έχεις εγγραφεί στη ροή"
    else
      redirect_to subscriptions_path
      # flash message
      flash[:success] = "Τι εν τούτο που μου δωκες"
    end
      
=======
    # Αν δεν υπάρχει η ροή στη βάση να τη δημιουργεί
    feed = Feed.find_or_initialize_by(url: params[:subscription][:url])
    if feed.new_record?
      xml = Feedjira::Feed.fetch_and_parse params[:subscription][:url] 
      feed.title = xml.title 
      feed.save
    end
    Subscription.find_or_create_by(user_id: current_user.id, feed_id: feed.id )
    redirect_to subscriptions_path
    # flash message
    flash[:success] = "Έχεις εγγραφεί στη ροή"
>>>>>>> 33d0173cfd79df6567b76997b2b01b34b8f68d70
  end

  def edit
    # Το πιο κάτω κάνει δουλειά του create - να μετακινηθεί σε μια φάση
    Subscription.find_or_create_by(user_id: current_user.id, feed_id: params[:id] )
    redirect_to subscriptions_path
    # flash
    flash[:success] = "Έχεις εγγραφεί στη ροή"
  end

  def destroy

  end
  
end
