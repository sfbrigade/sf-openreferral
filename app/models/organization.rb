class Organization < ActiveRecord::Base
  validates :name, :tag_list, presence: true
  acts_as_taggable
end
