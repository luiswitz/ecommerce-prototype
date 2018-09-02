require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module EcommercePrototypeRails
  class Application < Rails::Application
    config.load_defaults 5.2

    config.autoload_paths += %W(#{config.root}/app)
  end
end
