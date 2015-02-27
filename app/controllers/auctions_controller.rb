class AuctionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @auctions = Auction.all
  end

  def new
    @auction = Auction.new
  end

  def create
    @auction = current_user.auctions.new auction_params
    if @auction.save
      redirect_to auction_path(@auction)
      flash[:notice] = "Auction created!"
    else
      redirect_to root_path
      flash[:alert] = "Error! Auction was not created"
    end
  end

  def show
    @auction = Auction.find params[:id]
    @bid = Bid.new
  end

  def edit
  end

  def update
  end

  def destroy

  end

  private

  def auction_params
    params.require(:auction).permit(:title, :details, :ends_on, :reserve_price, :user_id)
  end
end