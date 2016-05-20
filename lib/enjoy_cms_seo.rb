unless defined?(Enjoy) && Enjoy.respond_to?(:orm) && [:active_record, :mongoid].include?(Enjoy.orm)
  puts "please use enjoy_cms_mongoid or enjoy_cms_activerecord"
  puts "also: please use enjoy_cms_news_mongoid or enjoy_cms_news_activerecord and not enjoy_cms_news directly"
  exit 1
end

require "enjoy/seo/version"

# require 'enjoy_cms'

require 'enjoy/seo/configuration'
require 'enjoy/seo/engine'


module Enjoy::Seo
  class << self
    def orm
      Enjoy.orm
    end
    def mongoid?
      Enjoy::Seo.orm == :mongoid
    end
    def active_record?
      Enjoy::Seo.orm == :active_record
    end
    def model_namespace
      "Enjoy::Seo::Models::#{Enjoy::Seo.orm.to_s.camelize}"
    end
    def orm_specific(name)
      "#{model_namespace}::#{name}".constantize
    end
  end

  autoload :Admin,  'enjoy/seo/admin'
  module Admin
    autoload :SitemapData,  'enjoy/seo/admin/sitemap_data'
    autoload :Seo,          'enjoy/seo/admin/seo'
  end

  module Models
    autoload :SitemapData,  'enjoy/seo/models/sitemap_data'
    autoload :Seo,          'enjoy/seo/models/seo'

    module Mongoid
      autoload :SitemapData,  'enjoy/seo/models/mongoid/sitemap_data'
      autoload :Seo,          'enjoy/seo/models/mongoid/seo'
    end

    module ActiveRecord
      autoload :SitemapData,  'enjoy/seo/models/active_record/sitemap_data'
      autoload :Seo,          'enjoy/seo/models/active_record/seo'
    end
  end

end
