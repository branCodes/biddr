require 'rails_helper'

RSpec.describe BidsController, type: :controller do
  describe "#create" do
    it "should redirect back to the auction page after bidding" do
      @auction = Auction.create(title:'lol')
      @bid = @auction.bids.new 
      if @bid.save
        expect(response).to redirect_to auction_path(@auction)
      end
    end
  end
end
