class CreateHealthData < ActiveRecord::Migration[5.0]
  def change
    create_table :health_data do |t|
      t.integer :provider_id
      t.string :provider_name
      t.string :provider_street_address
      t.string :provider_state
      t.integer :provider_zip_code
      t.float :average_covered_charges
      t.float :average_total_cost
      t.float :average_medicare_payments
      t.string :drg_definition

      t.timestamps
    end
  end
end
