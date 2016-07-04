require 'rails/generators'

module Enjoy::Seo
  class ConfigGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    desc 'Enjoy::Seo Config generator'
    def config
      template 'enjoy_seo.erb', "config/initializers/enjoy_seo.rb"
    end

  end
end
