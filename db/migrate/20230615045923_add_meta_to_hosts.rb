class AddMetaToHosts < ActiveRecord::Migration[7.0]
  def change
    add_column :hosts, :meta, :jsonb, null: false, default: {}
  end
end
