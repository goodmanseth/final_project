class ReviewsController < ApplicationController
  def create
    @health_datum = HealthDatum.find(params[:health_datum_id])
    @review = @health_datum.reviews.create(review_params)
    # @review.create_activity :create, :owner => current_user
    redirect_to health_datum_path(@health_datum)
  end

  def destroy
    @health_datum = HealthDatum.find(params[:health_datum_id])
    @review = @health_datum.reviews.find(params[:id])
    @review.destroy
    # @review.create_activity :destroy, :owner => current_user
    redirect_to health_datum_path(@health_datum)
  end

  private
    def review_params
      params.require(:review).permit(:reviewer, :body, :user_id)
    end
end
