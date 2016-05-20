module Enjoy::Seo
  if Enjoy.active_record?
    class SitemapData < ActiveRecord::Base
    end
  end

  class SitemapData
    include Enjoy::Seo::Models::SitemapData

    include Enjoy::Seo::Decorators::SitemapData

    rails_admin(&Enjoy::Seo::Admin::SitemapData.config(false, rails_admin_add_fields) { |config|
      rails_admin_add_config(config)
    })
  end
end
