class SshConfigurationService < ApplicationService
  def call(host, tacacs_user)
    ConfigurationWorker.perform_async(host.address, tacacs_user.username, tacacs_user.password)
  end
end