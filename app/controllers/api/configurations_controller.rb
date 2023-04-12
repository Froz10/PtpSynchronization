module Api
  class ConfigurationsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index    
      respond_to do |format|
        format.json {
          render json: @host.to_json, status: :ok
        }
      end
    end
    
    def create
      result = SshConfigurationService.new.call(@host, current_user.tacacs_users.first)
      render json: result.to_json, status: :ok
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
end
