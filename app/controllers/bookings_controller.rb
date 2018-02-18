class BookingsController < ApplicationController

 #before_action :authenticate

 def new

  booking = {}
  booking = {:freetime_id => params[:id],:client_id => current_user.id }
  freetime = {:client_id => current_user.id }
  Booking.create(booking)
  #Freetime.update(freetime)

 end

 def create_params

   

 end


end
