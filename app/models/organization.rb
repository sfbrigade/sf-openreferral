class Organization < ActiveRecord::Base
  acts_as_taggable_on :services
  belongs_to :import

  validates :name, presence: true

  def valid_status
    if service_list.any?
      :valid
    else
      :invalid
    end
  end
end
