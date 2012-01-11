class Feature < ActiveRecord::Base
  has_many :feature_versions
  has_many :versions, :through => :feature_versions
  belongs_to :category
end
