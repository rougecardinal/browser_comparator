class BrowserFamily < ActiveRecord::Base
  has_many :versions
  
  def last_version_has_feature?(feature)
    versions.last.has_feature? feature
  end
end
