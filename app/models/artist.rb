class Artist < ActiveRecord::Base
  has_many :pieces
  has_and_belongs_to_many :exhibitions

  scope :on_roster, -> { where(gallery_roster: true) }
  
end
