class YoyakusController < ApplicationController
  def index
    @yoyakus = Yoyaku.all.order("created_at DESC")
    @posts = Post.all
    @users = User.all
  end

  def new 
    @yoyaku = Yoyaku.new
  end

  def create
    @yoyaku = Yoyaku.new(
      user_id:@current_user.id,
      post_id: params[:post_id],
      start_date: params[:start_date],
      finish_date: params[:finish_date],
      number_of_people: params[:number_of_people],
    )
    if @yoyaku.save
      flash[:notice] = "予約を受け付けました"
    else
      render "new"
    end
  end

  def show
  end

end
