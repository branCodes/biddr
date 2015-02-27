class AuctionsController < ApplicationController
  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new auction_params
    if @auction.save
      flash[:notice] = "Auction created!"
    else
      flash[:alert] = "Error! Auction was not created"
    end
  end

  def show
    @auction = Auction.find params[:id]
  end



  private

  def auction_params
    params.require(:auction).permit(:title, :details, :ends_on, :reserve_price)
  end
end