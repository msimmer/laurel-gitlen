class Exhibition < ActiveRecord::Base
  has_and_belongs_to_many :pieces, join_table: :displays
  has_and_belongs_to_many :artists
  
  validates_presence_of :name

  serialize :piece_order
  serialize :artists_order

  attr_accessor :artists_ids
  
  def save_with_artists
    if valid?
      self.artists = Artist.where(id: artists_ids)
      self.save
    end
  end
  
  def safe_piece_order
    begin
      piece_order.delete_if { |id|
        !pieces.map{ |p| p.id }.include?(id)
      }
    rescue
      []
    end
  end
  
end
