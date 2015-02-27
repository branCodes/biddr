class AddColumnReservePriceToAuctions < ActiveRecord::Migration
  def change
    add_column :auctions, :reserve_price, :integer
  end
end
