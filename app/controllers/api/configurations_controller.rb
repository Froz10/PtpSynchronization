module Api
  class ConfigurationsController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_host!

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

    private

    def set_host!
      @host = Host.find_by!(name: params[:name])
    rescue ActiveRecord::RecordNotFound => e
      respond_to do |format|
        format.json do
          render json: { error: e.message }.to_json, status: 404
        end
      end
    end
  end
end
