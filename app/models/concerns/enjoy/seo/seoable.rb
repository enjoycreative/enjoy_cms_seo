module Enjoy::Seo::Seoable
  extend ActiveSupport::Concern
  LOCALIZED_FIELDS = [:h1, :title, :keywords, :description, :og_title]
  FIELDS = LOCALIZED_FIELDS + [:og_image, :robots]

  included do
    has_one :seo, as: :seoable, autosave: true, class_name: "Enjoy::Seo::Seo"
    accepts_nested_attributes_for :seo

    delegate(*FIELDS, to: :seo)
    delegate(*(FIELDS.map {|f| "#{f}=".to_sym }), to: :seo)

    if Enjoy::Seo.config.localize
      delegate(*(LOCALIZED_FIELDS.map {|f| "#{f}_translations".to_sym }), to: :seo)
      delegate(*(LOCALIZED_FIELDS.map {|f| "#{f}_translations=".to_sym }), to: :seo)
    end

    alias seo_without_build seo
    def seo
      seo_without_build || build_seo
    end


    def default_seo_h1
      if self.respond_to?(:name)
        self.name
      elsif self.respond_to?(:title)
        self.title
      end
    end
    def default_seo_title
      if self.respond_to?(:name)
        self.name
      elsif self.respond_to?(:title)
        self.title
      end
    end
    def default_seo_keywords
      ""
    end
    def default_seo_description
      ""
    end
    def default_seo_og_title
      if self.respond_to?(:name)
        self.name
      elsif self.respond_to?(:title)
        self.title
      end
    end

    def set_default_seo?
      true
    end
  end

  def page_title
    return self.title unless self.title.blank?
    self.name if self.respond_to?(:name)
  end

  def get_og_title
    return self.og_title unless self.og_title.blank?
    self.name if self.respond_to?(:name)
  end

  def og_image_jcrop_options
    {aspectRation: 800.0/600.0}
  end

end
