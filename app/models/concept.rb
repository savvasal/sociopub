class Concept < ActiveRecord::Base
  has_many :subscriptions, dependent: :destroy
  has_many :users, through: :subscriptions
  has_many :bundles
  has_many :words, through: :bundles
end
