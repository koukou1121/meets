class FreetimesController < ApplicationController

  before_action :user_logined?, except: :index

  def index

  end

  def new

    @freetime = Freetime.new

  end

  def show

    @freetimes = Freetime.where(user_id: current_user.id).order("time DESC").page(params[:page]).per(5)


  end

  def edit

    @freetime = Freetime.find(params[:id])

  end

  def update

    freetime = Freetime.find(params[:id])

    if freetime.user_id == current_user.id
      freetime.update(update_params)

    else
      flash[:notice] = "ユーザーが不正です"
    end

  end

  def destroy

    freetime = Freetime.find(params[:id])
    if freetime.user_id == current_user.id
      freetime.destroy
      redirect_to '/users'

    end
  end

  def list
    keyword = params[:search]
    @client = GooglePlace::Client.new( ENV['AIzaSyDah7UibzmNynUBiC42rViUL--kkCdoHDo'])
    @places = @client.spots_by_query( keyword )

  end

  def create

    Freetime.create(create_params)

  end

  def search

    @search = Freetime.ransack(search_params)
    @results = @search.result.where("time > ?", Date.today).order("time ASC").page(params[:page]).per(5)

  end



private

  def create_params
    params.require(:freetime).permit(:time, :place, :lang, :comments).merge(user_id: current_user.id)



  end

  def update_params
    params.require(:freetime).permit(:time, :place, :lang, :comments)


  end

  def search_params
    permit_params = params.require(:q).permit(:place_cont, :time_gteq, :lang_eq, :page)
    permit_params.merge(:flg_eq => nil)  # :flgのnilは未オファーのフラグ


  rescue
    { start_time_gteq: Time.zone.now }

  end

  def user_logined?

    if user_signed_in?

    else
      redirect_to "users/sign_in"
    end
  end


end
