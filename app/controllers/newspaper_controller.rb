class NewspaperController < ApplicationController
  before_action :admin_user, only: [:index]
  require "addressable/uri"
  def index
    # Όταν αφαιρέσω συνδρομή δεν φέρνει πάλι τα άρθρα της
    @ary = Array.new
    # Παίρνει τα feeds από τα subscriptions
    
    current_user.my_subscriptions.each do |feed|
      # αν μπορεί να αλλάξει κάπως να μεν τα πιάνει συνέχεια
      feed.fetch
      @ary << feed.id
    end
    @newspaper = Entry.joins(:sources).where(sources: {feed_id: @ary}).paginate(page: params[:page], :per_page => 9)
    # @newspaper = @newspaper.paginate(page: params[:page])
    current_user.my_subscriptions.each do |feed|
      feed.fetch
      @ary << feed.id
    end

    @newspaper = Entry.joins(:sources).where(sources: {feed_id: @ary})
    @newspaper = Entry.paginate(page: params[:page])
    # Κάνει ερώτημα από τα sources να πάρει τα entries που ανήκουν στα feeds του user
    # get_entries = current_user.my_entries
  end
end
