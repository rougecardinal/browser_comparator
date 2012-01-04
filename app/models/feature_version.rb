class FeatureVersion < ActiveRecord::Base
  belongs_to :version
  belongs_to :feature
end
