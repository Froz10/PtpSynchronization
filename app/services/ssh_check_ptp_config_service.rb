class SshCheckPtpConfigService < ApplicationService
  def call(host, tacacs_user)
    CheckPtpConfigWorker.perform_async(host.address, tacacs_user.username, tacacs_user.password, host.id)
  end
end