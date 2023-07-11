class SshCheckPtpInterfaceService < ApplicationService
  def call(host, tacacs_user)
    CheckPtpInterfaceWorker.perform_async(host.address, tacacs_user.username, tacacs_user.password, host.id)
  end
end