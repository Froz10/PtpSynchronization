module Api
  class ConfigurationsController < ApplicationController      
    def create
      host = Host.find_by(name: params[:name])
      if host.present?
        respond_to do |format|
            SshConfigurationService.new.call(host, current_user.tacacs_users.first)
            format.turbo_stream { 
              flash.now[:notice] = "Configuration was successfully created."
              render turbo_stream: turbo_stream.update('flash', partial:'layouts/flash')
            }
        end
      else
        head 404
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
end
