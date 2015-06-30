class Organization < ActiveRecord::Base
  acts_as_taggable_on :services
  belongs_to :import

  validates :name, presence: true
end
