class AddHospitalReferralRegionToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :hospital_referral_region, :string
  end
end
