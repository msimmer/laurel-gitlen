class Story < ActiveRecord::Base
  has_and_belongs_to_many :artists

  attr_accessor :artists_ids

  scope :featured, -> { where(featured: true) }

  def save_with_artists
    if valid?
      self.artists = Artist.where(id: artists_ids)
      self.save
    end
  end
  
end
