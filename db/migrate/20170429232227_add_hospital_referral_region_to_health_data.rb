class AddHospitalReferralRegionToHealthData < ActiveRecord::Migration[5.0]
  def change
    add_column :health_data, :hospital_referral_region, :string
  end
end
