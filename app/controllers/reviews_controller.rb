class ReviewsController < ApplicationController
    def create
        @visit = Visit.find(params[:visit_id])
        @review = Review.new(review_params)
        @review.visit = @visit
        @review.user = current_user
        if @review.save
          redirect_to visit_path(@visit)
        else
          # @dose = Dose.new voir pour profil user
          @booking = Booking.new
          render "visits/show"
        end
      end

    private

    def review_params
      params.require(:review).permit(:rating, :description)
    end
end
