module SubscriptionsHelper
<<<<<<< HEAD
  # προσωρινή λύση - κανονικά πρέπει να ελέγχεται από το model του feed
  # δεν δουλεύει καλά - θα πρέπει να ελέγχει αν επιστρέφει κάτι το συγκεκριμένο url
  # και αν αυτό το κάτι είναι xml - παραδειγμα στα λανθασμένα δέχεται το http://www
  def uri?(string)
    uri = URI.parse(string)
    %w( http https ).include?(uri.scheme)
  rescue URI::BadURIError
    false
  rescue URI::InvalidURIError
    false
  end
  
=======
>>>>>>> 33d0173cfd79df6567b76997b2b01b34b8f68d70
end
