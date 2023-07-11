class CheckPtpConfigWorker < ApplicationWorker
  def perform(ip_address, username, password, host_id)
    host = Host.find_by_id(host_id)
    return unless host

    Net::SSH.start(ip_address, username, password: password, :auth_methods => ["password"]) do |ssh|
      channel = ssh.open_channel do |ch|
        ch.send_channel_request("shell") do |ch, success|
          raise "could not execute command" unless success

          ch.on_data do |c, data|
            $stdout.print data
            if data.match? ("PTP state         :enable")
              host.update(ptp_config: "enable")
            end
          end
  
          ch.send_data("dis ptp all\n")
          ch.send_data(" quit\n")
        end
      end
      channel.wait
    
      ssh.loop { false }
    end
  end
end
