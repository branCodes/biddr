require 'rails_helper'

RSpec.describe BidsController, type: :controller do
  describe "#create" do
    def valid_bid
      @auction = Auction.create(title: 'lol')
      post :create, {bid: {
                          auction_id: 1,
                          bid_amount: 123    
                          }}
    end

    it "gives a flash notice if saved" do
      valid_bid
      expect(flash[:notice]).to be
    end
  end
end
