module Api
  class SynchronizationsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create  
      host = Host.find_by_id(params[:host_id])
    end
  
    private

    def check_ptp_status(host)
      ptp_status = SshCheckPtpStatusService.new.call(host, current_user.tacacs_users.first)
    end
  end
end