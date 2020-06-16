class VisitsController < ApplicationController
    skip_before_action :authenticate_user!, only: :index
    def index
        @visits = Visit.all
    end

    def show
        @visit = Visit.find(params[:id])
        @booking = Booking.new
        @review = Review.new
    end

    def new
        @visit = Visit.new
    end

    def create
        @visit = Visit.new(visit_params)
        @visit.user = current_user
        if @visit.save
            redirect_to visit_path(@visit)
        else
            render 'new'
        end
    end

    def edit
        @visit = Visit.find(params[:id])
    end
    
    def update
        @visit = Visit.find(params[:id])
        @visit.update(visit_params)

        redirect_to visit_path(@visit)
    end

    def destroy
        @visit = Visit.find(params[:id])
        @visit.destroy

        redirect_to visits_path
    end

    private 

    def visit_params
        params.require(:visit).permit(:title, :description, :price, :place, :tag, :photo)
    end
end
