class AddRegionRefToHosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :hosts, :region, null: false, foreign_key: true
  end
end
