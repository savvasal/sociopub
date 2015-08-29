class FindNewEntries
  STORY_AGE_THRESHOLD_DAYS = 3
  
  def initialize(raw_feed, feed_id, last_fetched, latest_entry_id = nil)
    @raw_feed = raw_feed
    @feed_id = feed_id
    @last_fetched = last_fetched
    @latest_entry_id = latest_entry_id
  end

  def new_entries
    entries = []
    
    @raw_feed.entries.each do |entry|
      break if @latest_entry_id && entry.id == @latest_entry_id

      unless story_age_exceeds_threshold?(entry) || Entry.exists?(entry.id, @feed_id)
        entries << entry
      end
    end

    entries
  end

  private

  def story_age_exceeds_threshold?(story)
    max_age = Time.now - STORY_AGE_THRESHOLD_DAYS.days
    entry.timestamp_updates < max_age
  end
end
