class AddPtpConfigToHosts < ActiveRecord::Migration[7.0]
  def change
    add_column :hosts, :ptp_config, :string, default: "disable"
  end
end
