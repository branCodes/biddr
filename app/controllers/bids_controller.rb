class BidsController < ApplicationController
  def create
    @auction = Auction.find params[:id]
    @bid = Bid.new
    @bid.save
  end
end