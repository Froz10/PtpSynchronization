class SshConnectingService < ApplicationService
  def call(host, tacacs_user)
    Net::SSH.start(host.address, tacacs_user.first.username, password: tacacs_user.first.password, :auth_methods => ["password"]) do |ssh|
      channel = ssh.open_channel do |ch|
        ch.send_channel_request("shell") do |ch, success|
          raise "could not execute command" unless success
    
          ch.send_data("sys\n")
          ch.send_data("aaa\n")
          ch.send_data("authorization-scheme default\n")
          ch.send_data("authorization-cmd 3 hwtacacs local\n")
          ch.send_data("quit\n")
          ch.send_data("quit\n")
          ch.send_data("commit\n")
          ch.send_data("quit\n")
          ch.send_data("quit\n")
        end
      end
      channel.wait
    
      ssh.loop { false }
    end
  end
end