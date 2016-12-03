Rails.application.configure do
  config.cache_classes = false
  config.eager_load = false

  config.consider_all_requests_local = true
  config.action_controller.perform_caching = false

  config.action_mailer.raise_delivery_errors = false

  config.active_support.deprecation = :log

  config.active_record.migration_error = :page_load
  config.assets.debug = true

  config.assets.digest = true
  config.assets.raise_runtime_errors = true

  ENV['CONSUMER_KEY'] = 'sdIndIpBKDTqdNqoY5mwislyu'
  ENV['CONSUMER_SECRET'] = 'K1pJDBVIg4FgL0aGZ1Y2b9veXVzyEEQwdPPkCKoNFP6SQCdr4s'
  ENV['CONSUMER_TOKEN'] = '3419564554-GQTHd3fhzvxCmhryObm8CoUQMmzarpzfcxmrXGg'
  ENV['CONSUMER_TOKEN_SECRET'] = 'k6mC2grV3Kgx016Mp672eszK9okQfik4IRU27Nk92zXe4'
  ENV['ACCESS_TOKEN'] = '3419564554-GQTHd3fhzvxCmhryObm8CoUQMmzarpzfcxmrXGg'
  ENV['ACCESS_TOKEN_SECRET'] = 'k6mC2grV3Kgx016Mp672eszK9okQfik4IRU27Nk92zXe4'
end
