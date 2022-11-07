class HostsController < ApplicationController
  def index
    @hosts = Host.all
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