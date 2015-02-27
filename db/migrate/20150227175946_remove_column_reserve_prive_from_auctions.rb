class RemoveColumnReservePriveFromAuctions < ActiveRecord::Migration
  def change
    remove_column :auctions, :reserve_prive
  end
end
