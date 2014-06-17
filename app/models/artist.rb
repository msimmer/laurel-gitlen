class Artist < ActiveRecord::Base
  has_many :pieces
  has_and_belongs_to_many :exhibitions
  has_and_belongs_to_many :stories

  scope :on_roster, -> { where(gallery_roster: true) }
  serialize :piece_order
  
  def to_param
    "#{id}-#{name.parameterize}"
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
