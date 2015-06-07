class Organization < ActiveRecord::Base
  belongs_to :import

  validates :name, presence: true
end
