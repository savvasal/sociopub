class FeedsController < ApplicationController
  before_action :admin_user, only: [:edit, :update, :fetch]
  before_action :logged_in_user, only: [:index, :new, :create]
  def index
    @feeds = Feed.paginate(page: params[:page], :per_page => 9)
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

  def fetch
    feed = Feed.find_by(id: params[:id])
    counter = 0
    # τραβά τα άρθρα από τη πηγή και τα καταχωρεί στη βάση
    # να ελέγχει το host url - αν υπάρχει στη βάση - αν δεν υπάρχει να το βάλει
    # και να ελέγχει αν είναι συμβατό
    xml = Feedjira::Feed.fetch_and_parse feed.url
    xml.entries.each do |e|
      website = Website.find_or_create_by(url: Addressable::URI.parse(e.url).host)
      if website.compatible 
        # λογικά το forloop να σταματά όταν βρει άρθρο που υπάρχει
        # ίσως να μπορεί να κάμει κάτι με την ημερομηνία
        item = Entry.find_or_initialize_by(url: e.url)
        # Να μετρά πόσα έβαλε και να εμφανίζει τον αριθμό με φλάς
        if item.new_record?
          item.title = e.title
          item.save
          counter += 1
        end
        # aprox 2-5ms each
        Source.find_or_create_by(feed_id: feed.id, entry_id: item.id)
      end
    end
    flash[:success] = "#{counter} άρθρα έχουν προστεθεί"
    redirect_to feeds_path(:page => params[:page])
  end
  
  
  
  private

  def feed_params
    params.require(:feed).permit(:title, :url, :compatible)
  end

end
