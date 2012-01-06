class OsVersion < ActiveRecord::Base
  belongs_to :os
  belongs_to :versions
end
