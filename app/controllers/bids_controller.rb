class BidsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    auction = Auction.find params[:id]
    @bid = current_user.auction.bids.new
  end

  def create
    @auction = Auction.find params[:auction_id]
    @bid = @auction.bids.create(bid_params)
    if @bid.save
      flash[:notice] = "Your bid has been placed!"
      redirect_to auction_path(@auction)
    else 
      flash[:alert] = "Error in placing your bid"
      redirect_to auction_path(@auction)
    end
  end

  private

  def bid_params
    params.require(:bid).permit(:bid_amount, :user_id)
  end
end