class NewspaperController < ApplicationController
  def index
    # Όταν αφαιρέσω συνδρομή δεν φέρνει πάλι τα άρθρα της
    @ary = Array.new
    # Παίρνει τα feeds από τα subscriptions
    current_user.my_subscriptions.each do |feed|
      feed.fetch
      @ary << feed.id
      end

    @newspaper = Entry.joins(:sources).where(sources: {feed_id: @ary}).paginate(page: params[:page])
    # @newspaper = @newspaper.paginate(page: params[:page])
    # Κάνει ερώτημα από τα sources να πάρει τα entries που ανήκουν στα feeds του user
    # get_entries = current_user.my_entries
  end
end
