class BookingsController < ApplicationController

 before_action :authenticate_user!

 def new

  #booking = {}
  #freetime = {}
  booking = {:freetime_id => params[:id],:client_id => current_user.id }
  #freetime = {:id => params[:id], :client_id => current_user.id }
  Booking.create(booking)
  Freetime.find(params[:id]).update(client_id: current_user.id)

 end

 def create_params


 end


end
