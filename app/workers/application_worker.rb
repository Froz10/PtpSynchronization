class ApplicationWorker
  include Sidekiq::Worker

  sidekiq_options retry: true
end