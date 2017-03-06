Devise.setup do |config|
  
  config.mailer_sender = 'Iniciacion IPN <iniciacionipn@gmail.com>'

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [ :email ]

  config.strip_whitespace_keys = [ :email ]

  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 10

  config.reconfirmable = true

  config.expire_all_remember_me_on_sign_out = true

  config.password_length = 8..128

  config.reset_password_within = 6.hours

  config.sign_out_via = :delete

  require 'omniauth-google-oauth2'
  config.omniauth :google_oauth2, '315688388206-s6r7h20da3djehdh5gh8itu5u74ee4dj.apps.googleusercontent.com', '0nPtccZ_yPFiqidxEVQLsEy4', {access_type: "offline", approval_prompt: ""}

  require 'omniauth-facebook'
  config.omniauth :facebook, '1401732259876976', 'c1fbb181398736db4140cb0000d619ad'

  require 'omniauth-github'
  config.omniauth :github, '850eb4395d1f4cd0d0a6', 'f42c7c3e63e00ddfd1d876502dc308fec2bb8748', scope: "user:email"

end