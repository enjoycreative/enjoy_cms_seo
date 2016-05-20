class EnjoyCreateSeos < ActiveRecord::Migration
  def change
    ############## SEO ###################33
    create_table :enjoy_seo_seos do |t|
      t.boolean :enabled, default: true, null: false
      t.integer :seoable_id
      t.string  :seoable_type

      if Enjoy::Seo.config.localize
        t.column :h1_translations, 'hstore', default: {}
        t.column :title_translations, 'hstore', default: {}
        t.column :keywords_translations, 'hstore', default: {}
        t.column :description_translations, 'hstore', default: {}
        t.column :og_title_translations, 'hstore', default: {}
      else
        t.string :h1
        t.string :title
        t.text :keywords
        t.text :description
        t.string :og_title
      end
      t.string :robots
      t.attachment :og_image

      t.timestamps
    end

    add_index :enjoy_seo_seos, [:seoable_id, :seoable_type], unique: true



    ################# SITEMAP #####################
    create_table :enjoy_seo_sitemap_data do |t|
      t.boolean :enabled, default: true, null: false
      t.integer :sitemap_data_field_id
      t.string  :sitemap_data_field_type

      t.boolean :sitemap_show, default: true, null: false
      t.timestamps :sitemap_lastmod
      t.string :sitemap_changefreq
      t.float :sitemap_priority

      t.timestamps
    end

    add_index :enjoy_seo_sitemap_data, [:sitemap_data_field_id, :sitemap_data_field_type], unique: true
  end
end
