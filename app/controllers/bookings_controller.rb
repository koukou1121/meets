class BookingsController < ApplicationController

 before_action :authenticate_user!

 def new

  #checking user of making the freetime and user of offering
  ftUser_id = Freetime.find(params[:id]).user_id
  if current_user.id == ftUser_id then
    #投稿者とオファー者が同じだからエラーを返す
    @offer = false

  else
  booking = {:freetime_id => params[:id],:client_id => current_user.id }
  #freetime = {:id => params[:id], :client_id => current_user.id }
  Booking.create(booking)
  Freetime.find(params[:id]).update(client_id: current_user.id)
  end

 end

 def show

  #将来複数人のオファーに対応するため、クライアントが予約したfreetimeは一旦booking
  #モデルを経由して取り出す！！！
  freetime_id = Booking.where(client_id: current_user.id).select(:freetime_id)
  #過去のbookingを除外する
  freetimes_all = Freetime.where(id: freetime_id)
    freetimes_all.each do |freetimes_all|
      #一つでもマイナスが出れば過去
      y = freetimes_all.time.year - Date.today.year
      m = freetimes_all.time.month - Date.today.month
      d = freetimes_all.time.day - Date.today.day
      jg_pst = y + m + d

      if jg_pst < 0
        #過去オファーのためスキップする

        else

         @freetimes = freetimes_all

      end

    end

        #過去オファーを除外したfreetimesオブジェクトを返す
        #orderメソッドやkaminariはモデルじゃないと動かないっぽい？
        @freetimes.page(params[:page]).per(5)


 end

 def create_params


 end


end
