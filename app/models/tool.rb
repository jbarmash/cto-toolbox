class Tool < ActiveRecord::Base

  #markable_as :toolbox, :by => :user
  acts_as_taggable
  #acts_as_taggable_on :tags
  has_and_belongs_to_many :users

end
