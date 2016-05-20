module Enjoy::Seo
  module Models
    module Seo
      extend ActiveSupport::Concern
      include Enjoy::Model
      include Enjoy::Enableable
      if Enjoy::Seo.config.gallery_support
        include Enjoy::Gallery::Paperclipable
      end

      include Enjoy::Seo.orm_specific('Seo')

      included do
        belongs_to :seoable, polymorphic: true

        if Enjoy::Seo.config.gallery_support
          enjoy_cms_attached_file(:og_image,
                    styles: lambda { |attachment| attachment.instance.og_image_styles }
          )
        end

        before_save do
          set_default_seo
        end
      end

      def set_default_seo
        _obj = self.seoable
        if _obj and _obj.set_default_seo?
          self.h1           = _obj.default_seo_h1           if self.h1.blank?
          self.title        = _obj.default_seo_title        if self.title.blank?
          self.keywords     = _obj.default_seo_keywords     if self.keywords.blank?
          self.description  = _obj.default_seo_description  if self.description.blank?
          self.title        = _obj.default_seo_og_title     if self.title.blank?
        end
      end

      def og_image_styles
        {thumb: "800x600>"}
      end

      def og_image_jcrop_options
        {}
      end
    end
  end
end
