class Version < ActiveRecord::Base
  belongs_to :browser_family
  has_many :feature_versions
end
