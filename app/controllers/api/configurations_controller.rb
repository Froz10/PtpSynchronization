module Api
  class ConfigurationsController < ApplicationController
    def create
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
  end
end
