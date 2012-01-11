class Version < ActiveRecord::Base
  has_many :feature_versions
  has_many :features, :through => :feature_versions 

  belongs_to :browser_family
  has_many :os_versions
end
