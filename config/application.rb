require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Connect
  class Application < Rails::Application
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    config.load_defaults 5.2
    config.i18n.default_locale = :ja

  end
end
