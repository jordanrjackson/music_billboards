class Song < ApplicationRecord
  belongs_to :artist
  belongs_to :billboard, optional: true

  def info
    "#{self.title} - #{self.artist.name}"
  end
end