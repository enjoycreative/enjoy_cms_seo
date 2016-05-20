module Enjoy::Seo
  if Enjoy.active_record?
    class Seo < ActiveRecord::Base
    end
  end

  class Seo
    include Enjoy::Seo::Models::Seo

    include Enjoy::Seo::Decorators::Seo

    rails_admin(&Enjoy::Seo::Admin::Seo.config(false, rails_admin_add_fields) { |config|
      rails_admin_add_config(config)
    })
  end
end
