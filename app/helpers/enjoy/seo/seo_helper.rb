module Enjoy::Seo::SeoHelper

  def enjoy_ym_counter_tag(counter_id)
    render partial: "blocks/ym", locals: {counter_id: counter_id}
  end
  def enjoy_ga_counter_tag(counter_id)
    render partial: "blocks/ga", locals: {counter_id: counter_id}
  end
  def render_enjoy_counters(opts = {})
    ret = []
    ym_counter_id = opts[:ym_counter_id] || Settings.ym_counter_id(default: '', kind: :string, title: 'Yandex Метрика ID').strip
    ga_counter_id = opts[:ga_counter_id] || Settings.ga_counter_id(default: '', kind: :string, title: 'Google Analitics ID').strip
    ret << enjoy_ym_counter_tag(ym_counter_id) unless ym_counter_id.blank?
    ret << enjoy_ga_counter_tag(ga_counter_id) unless ga_counter_id.blank?
    ret.join
  end
end
