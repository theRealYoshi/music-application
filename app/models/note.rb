# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  long_note  :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  track_id   :integer
#

class Note < ActiveRecord::Base

  validates :long_note, presence: true

  belongs_to :user
  belongs_to :track
  
end
