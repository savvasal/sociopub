class Bundle < ActiveRecord::Base
  belongs_to :word
  belongs_to :concept
end
