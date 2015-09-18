# == Schema Information
#
# Table name: tracks
#
#  id          :integer          not null, primary key
#  album_id    :integer          not null
#  track_type  :string           not null
#  lyrics      :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  track_title :string
#

class Track < ActiveRecord::Base
  belongs_to :album
  has_one :band, through: :album, source: :band

  validates :track_title, :track_type, :album_id, presence: true
  validates :track_type, inclusion: { in: ["BONUS", "REGULAR"]}



end
