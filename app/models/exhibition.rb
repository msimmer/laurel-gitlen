class Exhibition < ActiveRecord::Base
  has_and_belongs_to_many :pieces, join_table: :displays
  has_and_belongs_to_many :artists
  
  after_save :ensure_its_the_only_current
  
  validates_presence_of :name

  serialize :piece_order
  serialize :artists_order

  attr_accessor :artists_ids
  
  def to_param
    "#{id}-#{name.parameterize}"
  end
  
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
  
  def current?
    self.begins < Date.today && Date.today < self.ends
  end
  
  private
  
  def ensure_its_the_only_current
    self.class.where.not(id: id).update_all(current: false) if current
  end
  
end
