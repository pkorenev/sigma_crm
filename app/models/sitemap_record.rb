class SitemapRecord < ActiveRecord::Base
  attr_accessible *attribute_names

  belongs_to :sitemap_resource, polymorphic: true, required: true
  attr_accessible :sitemap_resource

  @@change_freq_values = %w(always hourly daily weekly monthly yearly never).map(&:to_sym)

  @@default_change_freq = :monthly

  @@default_priority = 0.8

  def url

  end

  def change_freq
    val = self['change_freq']
    if val.present? && val.to_sym.in?(@@change_freq_values)
      return val
    else
      return @@default_change_freq
    end
  end

  def priority
    val = self['priority'].to_f
    if val >= 0 && val <= 1
      return val
    else
      return @@default_priority
    end
  end

  def loc
    sitemap_resource.computed_url
  end

  def last_mod
    sitemap_resource.updated_at
  end

  def self.build_xml

  end

  def to_xml

  end
end
