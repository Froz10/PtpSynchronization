class CheckPtpInterfaceWorker < ApplicationWorker
  def perform(ip_address, username, password, host_id)
    host = Host.find_by_id(host_id)
    return unless host
    array_ptp_interfaces = []

    Net::SSH.start(ip_address, username, password: password, :auth_methods => ["password"]) do |ssh|
      session = ssh.open_channel do |channel|
        channel.exec ["dis ptp-adaptive config", "quit"] do |ch, success|
          raise "could not execute command" unless success
          

          # "on_data" is called when the process writes something to stdout
          ch.on_data do |c, data|
            $stdout.print data
            ch.send_data(" \n") if data.match?("---- More ----")

            data.scan (/GigabitEthernet\S+\b/) do |matchdata|
              array_ptp_interfaces << matchdata.to_s
            end
          end
        end
      end
  
      session.wait
      ssh.loop
    end

    host.update(meta: host.meta.merge(ptp_interfaces: array_ptp_interfaces))
  end
end
