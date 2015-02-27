class Bid < ActiveRecord::Base
  belongs_to :auction
  validates :bid_amount, presence: true
end
