module Api
  class ConfigurationsController < ApplicationController
    skip_before_action :verify_authenticity_token
  
    def index
      host = Host.find_by!(name: params[:name])
      
      respond_to do |format|
        format.json {
          render json: host.to_json, status: :ok
        }
      end
    rescue ActiveRecord::RecordNotFound => e
      respond_to do |format|
        format.json do
          render json: { error: e.message }.to_json, status: 404
        end
      end
    end

    def create
      host = Host.find_by(name: params[:name])
      result = SshConnectingService.new.call(host, current_user.tacacs_users)
      render json: result.to_json, status: :ok
    end
  end
end
