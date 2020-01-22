Recaptcha.configure do |config|
  config.site_key = ENV['RECAPTCHA_PUBLIC_KEY']
  config.secret_key = ENV['RECAPTCHA_PRIVATE_KEY']
  # config.site_key = ENV['6LeOVNEUAAAAANR2e_rgTELXA6mF0S8i8syZChy8']
  # config.secret_key = ENV['6LeOVNEUAAAAAM2jOKniz6jm2TuLbSol8XMwR3H-']
end