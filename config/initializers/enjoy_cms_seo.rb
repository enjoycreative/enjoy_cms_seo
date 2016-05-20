  Enjoy.configure do |config|
    config.ability_manager_config ||= []
    config.ability_manager_config << {
      method: :can,
      model: Enjoy::Seo::Seo,
      actions: [:edit]
    }
    config.ability_manager_config << {
      method: :can,
      model: Enjoy::Seo::SitemapData,
      actions: [:edit]
    }

    config.ability_admin_config ||= []
    config.ability_admin_config << {
      method: :cannot,
      model: Enjoy::Seo::Seo,
      actions: [:new, :create]
    }
    config.ability_admin_config << {
      method: :cannot,
      model: Enjoy::Seo::SitemapData,
      actions: [:new, :create]
    }
  end

  Enjoy.rails_admin_configure do |config|
    if defined?(RailsAdminComments)
      config.action_visible_for :comments, 'Enjoy::Seo::Seo'
      config.action_visible_for :comments, 'Enjoy::Seo::SitemapData'
      config.action_visible_for :model_comments, 'Enjoy::Seo::Seo'
      config.action_visible_for :model_comments, 'Enjoy::Seo::SitemapData'
    end
  end
