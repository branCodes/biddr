class BidsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    auction = Auction.find params[:id]
    @bid = current_user.auction.bids.new
  end

  def create
    @auction = Auction.find params[:auction_id]
    @lastbid = Bid.last 
    @bid = @auction.bids.new(bid_params)
    @bid.user_id = current_user.id
    if @bid.bid_amount > @auction.current_bid
      @auction.current_bid = @bid.bid_amount
      @auction.save
      if @bid.save
        flash[:notice] = "Your bid has been placed!"
        redirect_to auction_path(@auction)
      else 
        flash[:alert] = "Error in placing your bid"
        redirect_to auction_path(@auction)
      end
    else
      flash[:alert] = "Error in placing your bid"
      redirect_to auction_path(@auction)
    end
  end

  def user_bids
    @bids = current_user.bids.all
  end

  private

  def bid_params
    params.require(:bid).permit(:bid_amount, :user_id)
  end
end