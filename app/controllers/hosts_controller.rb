class HostsController < ApplicationController
  def index   
  end

  def search
    if params[:hostname].present?
      hosts = Host.filter_by_name(params[:hostname]).map(&:name)
    else
      hosts = []
    end
   
    render(json: { hostnames: hosts })
  end
end