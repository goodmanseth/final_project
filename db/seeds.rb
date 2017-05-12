# seeding the db with 10000 entries (rather than the whole ~160000), which is Heroku's limit
(0..498).each do |i|
  client = SODA::Client.new({:domain => "data.cms.gov", :app_token => Rails.application.secrets.soda_API})
  results = client.get("ehrv-m9r6",{:$limit => 20, :$offset => i*320})

  results.each do |result|
    HealthDatum.create(:drg_definition => result["drg_definition"],
          :provider_id => result["provider_id"],
          :provider_name => result["provider_name"],
          :provider_street_address => result["provider_street_address"],
          :provider_city => result["provider_city"],
          :provider_state => result["provider_state"],
          :provider_zip_code => result["provider_zip_code"],
          :average_covered_charges => result["average_covered_charges"],
          :average_total_cost => result["average_medicare_payments"],
          :average_medicare_payments => result["average_medicare_payments_2"],
          :hospital_referral_region => result["hospital_referral_region_description"])
  end
end

HealthDatum.all.each do |health_datum|
  health_datum.update(:provider_city => health_datum.provider_city.split.map(&:capitalize)*' ',
        :provider_name => health_datum.provider_name.split.map(&:capitalize)*' ',
        :provider_street_address => health_datum.provider_street_address.split.map(&:capitalize)*' ',
        :drg_definition => health_datum.drg_definition.split.map(&:capitalize)*' '
        )
end

# Seeding the administrator
user = User.new
user.first_name = 'admin'
user.email = 'admin@admin'
user.password = 'password'
user.password_confirmation = 'password'
user.admin = true
user.save!

## This is for updating the database (note that I eventually used the command db:drop to
## drop the database and shrink it to 10000 entries, which is the limit for Heroku.) Therefore
## this code was ultimately not used.

# client = SODA::Client.new({:domain => "data.cms.gov", :app_token => "m1qB29JXSOdh6RW6xpSUsF6Oy"})
# results = client.get("ehrv-m9r6",{:$limit => 50000, :$offset => 150000})
#
# results.each do |result|
#   result1 = HealthDatum.where(:provider_id => result["provider_id"]).where(:drg_definition => result["drg_definition"])
#   result1.update(:hospital_referral_region => result["hospital_referral_region_description"])
# end
