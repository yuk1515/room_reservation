class ReservationsController < ApplicationController

  def index
    @reservations =Reservation.all
  end

  def create
  @reservation = Reservation.new( 
    user_id:@current_user.id,
    post_id:params[:post_id],
    start_date:params[:start_date],
    fin_date:params[:fin_date],
    num_people:params[:num_people]
  )  
    @reservation.save 
    redirect_to("/posts/#{params[:post_id]}")
  end
end
