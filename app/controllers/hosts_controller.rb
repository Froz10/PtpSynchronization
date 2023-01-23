class HostsController < ApplicationController
  def index
    @regions = Region.all

    if params[:region].present?
      @region = Region.find_by_name(params[:region])
      @hosts = @region.hosts
    else
      @hosts = Host.includes(:region)
    end
  end

  def search
    if params[:hostname].present?
      @hosts = Host.filter_by_name(params[:hostname]).map(&:name)
    else
      @hosts = []
    end
   
    respond_to do |format|
      format.json {
        render json: { hostnames: @hosts }, partial: "shared/modal", locals: { hosts: @hosts }
      }
    end
  end
end