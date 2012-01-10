class BrowserFamily < ActiveRecord::Base
  has_many :versions
  
  def last_version_has_feature?(feature)
    versions.last.feature_versions.where(feature_id: feature.id).first != nil
  end
end
