class SshConnectingService < ApplicationService
  def call(host, tacacs_user)

    Net::SSH.start(host.address, tacacs_user.first.username, password: tacacs_user.first.password, :auth_methods => ["password"]) do |ssh|
      channel = ssh.open_channel do |ch|
        ch.send_channel_request("shell") do |ch, success|
          raise "could not execute command" unless success

          ch.on_data do |c, data|
            $stdout.print data
          end
  
          # "on_extended_data" is called when the process writes something to stderr
          ch.on_extended_data do |c, type, data|
            $stderr.print data
          end

          ch.send_data("sys\n")
          ch.send_data("clock source ptp priority 50\n")
          ch.send_data("clock source ptp ssm prc\n")
          ch.send_data("clock ethernet-synchronization enable\n")
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