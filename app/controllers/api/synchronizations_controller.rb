module Api
  class SynchronizationsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create  
      host = Host.find_by_id(params[:host_id])
      SshCheckPtpStatusService.new.call(host, current_user.tacacs_users.first)
      SshCheckPtpConfigService.new.call(host, current_user.tacacs_users.first)
      SshCheckInterfaceService.new.call(host, current_user.tacacs_users.first)
      SshCheckPtpInterfaceService.new.call(host, current_user.tacacs_users.first)
    end
  end
end