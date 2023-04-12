class HostsController < ApplicationController
  include Pagy::Backend

  def index
    @regions = Region.all
    @region = Region.find(params[:region_id])
    @q = @region.hosts.ransack(params[:q])
    hosts = @q.result(distinct: true).order(created_at: :asc)
    @pagy, @hosts = pagy_countless(hosts, items: 8)
  end
end