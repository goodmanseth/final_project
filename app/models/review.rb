class Review < ApplicationRecord
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user}

  belongs_to :health_datum
  belongs_to :user
  validates :reviewer, :presence => true
  validates :body, :presence => true
end
