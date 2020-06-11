class BookingsController < ApplicationController
    def create
        @visit = Visit.find(params[:visit_id])
        @booking = Booking.new(booking_params)
        @booking.visit = @visit
        @booking.user = current_user
        if @booking.save
            redirect_to dashboard_path
        else
            render "new"
        end
    end
    private 
    def booking_params
        params.require(:booking).permit(:checking_date, :checkout_date)
    end
end
