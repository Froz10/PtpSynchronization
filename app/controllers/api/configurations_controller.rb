module Api
  class ConfigurationsController < ApplicationController
    skip_before_action :verify_authenticity_token
  
    def create
      host = Host.find_by!(name: params[:name])
      SshConnectingService.new.call(host, current_user.tacacs_users)

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
  end
end
