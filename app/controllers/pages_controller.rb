class PagesController < ApplicationController
  
  def home
    @visits = Visit.all
  end

  def dashboard
    @user = current_user
    @bookings = @user.bookings
  end

  def destroy
    @booking = Bookings.find(params[:id])
    @booking.destroy
  end

end
