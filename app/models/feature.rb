class Feature < ActiveRecord::Base
  has_many :feature_versions
  belongs_to :category
end
