class PagesController < ApplicationController
  
  def home
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
