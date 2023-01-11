class AddPtpStatusToHosts < ActiveRecord::Migration[7.0]
  def change
    add_column :hosts, :ptp_status, :string, default: "unsynchronized"
  end
end
