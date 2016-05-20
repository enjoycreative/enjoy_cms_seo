module Enjoy::Seo
  module Models
    module Mongoid
      module Seo
        extend ActiveSupport::Concern
        included do

          if defined?(RailsAdminComments)
            include RailsAdminComments::Commentable
          end

          # field :name, type: String, localize: Enjoy::Seo.config.localize
          field :h1, type: String, localize: Enjoy::Seo.config.localize

          field :title, type: String, localize: Enjoy::Seo.config.localize
          field :keywords, type: String, localize: Enjoy::Seo.config.localize
          field :description, type: String, localize: Enjoy::Seo.config.localize
          field :robots, type: String, localize: Enjoy::Seo.config.localize

          field :og_title, type: String, localize: Enjoy::Seo.config.localize
        end
      end
    end
  end
end
