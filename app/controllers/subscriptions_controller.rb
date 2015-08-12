class SubscriptionsController < ApplicationController
 
  def index
    # Να αλλάξει
    # @subscriptions = Subscription.paginate(page: params[:page])
    # @feed = Feed.new
    # @subscription = Subscription.new
    @feeds = Feed.paginate(page: params[:page])
  end
  
  def show
    @subscription = Subscription.find(params[:user_id])
  end
  
  def new
    @feed = Feed.new
  end
  
  def create
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
