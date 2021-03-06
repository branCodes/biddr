require 'rails_helper'

RSpec.describe AuctionsController, type: :controller do

  describe "#new" do
    it "renders a new template" do
      get :new
      expect(response).to render_template(:new)
    end
    
    it "assigns a new auction instance" do
      get :new
      expect(assigns(:auction)).to be_a_new(Auction)
    end
  end

  describe "#create" do
    context "with valid parameters" do
      def valid_auction
        post :create, {auction: {
                          title: 'Valid Title',
                          detail: 'some valid deets',
                          ends_on: (Time.now + 10.days),
                          reserve_price: 20,
                          bid_amount: 0
                       }}
      end
      
      it "adds an auction to the database" do
        expect {valid_auction}.to change {Auction.count}.by(1)
      end

      it "creates a flash notice if the auction is saved" do
        valid_auction
        expect(flash[:notice]).to be
      end
    end

    context "with invalid parameters" do
      def invalid_auction
        post :create, {auction: {
                          title: nil,
                          detail: 'some valid deets',
                          ends_on: (Time.now + 10.days),
                          reserve_price: 20,
                          bid_amount: nil
                       }}
      end
      
      it "does not add an auction to the database" do
        expect {invalid_auction}.to change {Auction.count}.by(0)
      end

      it "creates a flash alert if the auction is saved" do
        invalid_auction
        expect(flash[:alert]).to be
      end
    end
  end

  describe "#show" do
    it "assigns an auction instance variable with passed id" do
      @auction = Auction.create(title:'lol')
      get :show, id: @auction.id
      expect(assigns(:auction)).to eq(@auction)
    end

    it "renders the show template" do
      @auction = Auction.create(title:'lols')
      get :show, id: @auction.id
      expect(response).to render_template(:show)
    end
  end

  describe "#index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "#edit" do
    before do 
      @auction = Auction.create(title:'loool')
      get :edit, id: @auction.id
    end

    it "renders the edit template" do
      expect(response).to render_template(:edit)
    end
  end

  describe "#destroy" do
    before do
      @auction = Auction.create(title:'lol')
    end

    it "deletes an auction from the database" do
      expect {delete :destroy, id: @auction.id}.to change {Auction.count}.by(-1)
    end
  end
end
