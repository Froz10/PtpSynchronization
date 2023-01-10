module Api
  class SynchronizationsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create  
      host = Host.find_by_id(params[:host_id])
      check_ptp_status(host)

      hosts = Host.all
      render turbo_stream: turbo_stream.replace('table_status',
      render_to_string(partial: 'hosts/table', locals: { hosts: hosts }))   
    end
  
    private

    def check_ptp_status(host)
      ptp_status = SshCheckPtpStatusService.new.call(host, current_user.tacacs_users.first)
    end
  end
end