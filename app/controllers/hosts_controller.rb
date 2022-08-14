class HostsController < ApplicationController
  def index
    @hosts = Host.all
  end

  def show
  end
end