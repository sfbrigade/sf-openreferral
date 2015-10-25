class Organization < ActiveRecord::Base
  belongs_to :import

  validates :name, presence: true

  def valid_status
    if valid?(:verification)
      :valid
    else
      :invalid
    end
  end
end
