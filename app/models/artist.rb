class Artist < ActiveRecord::Base
  has_many :pieces
  has_and_belongs_to_many :exhibitions
end
