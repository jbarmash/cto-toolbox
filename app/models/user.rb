class User < ActiveRecord::Base
   #acts_as_marker
   has_and_belongs_to_many :tools
   has_and_belongs_to_many :toolboxes
end
