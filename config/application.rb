require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Railsapp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

     config.assets.precompile += [ 'application.css', 'appviews.css', 'cssanimations.css', 'dashboards.css', 'forms.css', 'gallery.css', 'graphs.css', 'mailbox.css', 'miscellaneous.css', 'pages.css', 'tables.css', 'uielements.css', 'widgets.css', 'commerce.css' ]
     config.assets.precompile += [ 'application.js', 'appviews.js', 'cssanimations.js', 'dashboards.js', 'forms.js', 'gallery.js', 'graphs.js', 'mailbox.js', 'miscellaneous.js', 'pages.js', 'tables.js', 'uielements.js', 'widgets.js', 'commerce.js', 'metrics.js', 'landing.js' ]
     # wklejone ponizej
     config.i18n.default_locale = :en
     config.action_mailer.default_url_options = { host: 'http://projekt-panel-adm.infocal.eu' }
     config.action_mailer.raise_delivery_errors = true
     config.action_mailer.perform_deliveries = true
     config.action_mailer.asset_host = 'http://projekt-panel-adm.infocal.eu'
     ActionMailer::Base.delivery_method = :smtp
     ActionMailer::Base.smtp_settings = {
       :address              => "mail.projekt.infocal.eu",
       :port                 => 587,
       :domain               => "www.projekt-panel-adm.infocal.eu",
       :user_name            => "mail@projekt.infocal.eu",
       :password             => 'N8FhVxuw',
       :authentication       => "plain",
       :enable_starttls_auto => true,
       :openssl_verify_mode  => 'none'
     }
  end
end
