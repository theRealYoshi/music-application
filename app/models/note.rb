class Note < ActiveRecord::Base

  validates :long_note, presence: true

  belongs_to :user
  belongs_to :track
end
