class BidsController < ApplicationController
  def create
    @auction = Auction.find params[:id]
    @bid = @auction.bids.new
    if @bid.save
      flash[:notice] = "Your bid has been placed!"
      redirect_to auction_path(@auction)
    else 
      flash[:alert] = "Error in placing your bid"
      redirect_to auction_path(@auction)
    end
  end
end