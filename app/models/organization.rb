class Organization < ActiveRecord::Base
  belongs_to :import

  validates :name, :tag_list, presence: true
  acts_as_taggable
end
