class Version < ActiveRecord::Base
  belongs_to :browser_family
  has_many :feature_versions
  has_many :os_versions
end
