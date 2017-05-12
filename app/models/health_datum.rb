class HealthDatum < ApplicationRecord
  include PublicActivity::Model
  tracked

  has_many :reviews
  def full_street_address
    [provider_street_address, provider_city, provider_state].compact.join(', ')
  end
  def name_
    provider_name
  end
end
