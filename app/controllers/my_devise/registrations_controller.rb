class MyDevise::RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :state, :hospital_referral_region, :zip_code, :street_address, :city)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :state, :hospital_referral_region, :zip_code, :street_address, :city)
  end
end
