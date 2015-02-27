class Auction < ActiveRecord::Base
  has_many :bids
  validates :title, presence: true
end
