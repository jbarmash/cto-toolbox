class Tool < ActiveRecord::Base

  acts_as_taggable
  #acts_as_taggable_on :tags
  markable_as [ :used, :interested ]
	
end
