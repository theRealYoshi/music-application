# == Schema Information
#
# Table name: albums
#
#  id          :integer          not null, primary key
#  band_id     :integer          not null
#  performance :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  title       :string
#

class Album < ActiveRecord::Base

  belongs_to :band
  has_many :tracks, dependent: :destroy

  validates :title, :performance, :band_id, presence: true
  validates :performance, inclusion: { in: ["LIVE", "STUDIO"]}

end
