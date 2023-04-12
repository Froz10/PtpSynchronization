class HostsController < ApplicationController
  include Pagy::Backend

  def index
    @regions = Region.all
    @region = Region.find(params[:region_id])
    @q = @region.hosts.ransack(params[:q])
    @pagy, @hosts = pagy_countless(@q.result(distinct: true), items: 8)
  end
end