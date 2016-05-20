module Enjoy::Seo
  module Models
    module ActiveRecord
      module Seo
        extend ActiveSupport::Concern
        included do
          if Enjoy::Seo.config.localize
            translates :h1, :title, :keywords, :description, :og_title
          end
        end
      end
    end
  end
end
