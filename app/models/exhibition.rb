class Exhibition < ActiveRecord::Base
  has_and_belongs_to_many :pieces, join_table: :displays
  has_and_belongs_to_many :artists
  
  validates_presence_of :name
  before_validation :add_artists
  
  serialize :piece_order
  serialize :artists_order

  attr_accessor :artists_ids
  
  def add_artists
    unless artists_ids.blank?
      self.artists << Artist.find(artists_ids)
    end
  end
end
