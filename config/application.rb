require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
# require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PegandaV2
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
ActionMailer::Base.smtp_settings = {
}
  config.action_mailer.smtp_settings = {
    :enable_starttls_auto => false,
    :address => 'mail.authsmtp.com',
    :port => 25,
    :domain => "mail.authsmtp.com",
    :user_name => 'ac52377',
    :password => 'ksjrewd8vdfqpf',
    :authentication => 'plain',
   # user_name: Rails.application.secrets.email_provider_username,
   # password: Rails.application.secrets.email_provider_password
  }
  # ActionMailer Config
  config.action_mailer.asset_host = 'http://localhost:3000'
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.raise_delivery_errors = true
  # Send email in development mode?
  config.action_mailer.perform_deliveries = true



  end
end
