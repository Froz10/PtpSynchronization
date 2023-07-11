module ApplicationHelper
  include Pagy::Frontend

  def config_interfaces_is_valid?(host)
    status = []
    host.meta["interfaces"]&.each do |interface|
      status << host.meta["ptp_interfaces"].include?(interface)
    end

    status.all?(true)
  end
end
