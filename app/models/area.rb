class Area < ActiveRecord::Base
  set_primary_key "gid"
  acts_as_spatial :geom => 'wgs_geom'
end
