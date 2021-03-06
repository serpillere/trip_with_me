class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  
  def home
    @visits = Visit.all
    @geocodes = Visit.geocoded # returns flats with coordinates
         @markers = @geocodes.map do |visit|
        {
            lat: visit.latitude,
            lng: visit.longitude
        }
    end
  end

  def dashboard
    @user = current_user
    @bookings = @user.bookings
    
    @my_visits_bookings = current_user.visits.map do |visit|
      visit.bookings
    end.flatten

    
  end

  def destroy
    @booking = Bookings.find(params[:id])
    @booking.destroy
  end

end
