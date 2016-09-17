class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :juke_track, touch: true


end
