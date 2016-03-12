class Keyword < ActiveRecord::Base
  belongs_to :word
  belongs_to :entry
end
