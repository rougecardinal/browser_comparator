class OsVersion < ActiveRecord::Base
  belongs_to :os
  belongs_to :version
  
  def to_s
    "#{os.name} : #{version.name}"
  end
end
