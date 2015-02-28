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
    @auction = Auction.find params[:id]
  end

  def update
    @auction = Auction.find params[:id]
    if @auction.update auction_params
      redirect_to auction_path(@auction)
    else 
      render :edit
    end
  end

  def destroy
    @auction = Auction.find params[:id]
    if @auction.destroy
      redirect_to auctions_path
      flash[:notice] = "Auction deleted!"
    else
      redirect_to auction_path(@auction)
      flash[:alert] = "Error in deleting your auction"
    end
  end

  private

  def auction_params
    params.require(:auction).permit(:title, :details, :ends_on, :reserve_price, :user_id, :current_bid)
  end
end