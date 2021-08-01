class PostsController < ApplicationController
  before_action :authenticate_user

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def show
    @post= Post.find_by(id:params[:id])
    @user= @post.user
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(
      content: params[:content],
      user_id: @current_user.id,
      photo: "default_post.jpg",
      price: params[:price],
      address: params[:address]
      )
      if params[:image]
        @post.photo ="#{@post.id}.jpg"
        image = params[:image]
        File.binwrite("public/post_images/#{@post.photo}",image.read)
      end
    if @post.save
      flash[:notice] = "新規作成完了"
      redirect_to("/posts/index")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end
  
  def update
    @post = Post.find_by(id:params[:id])
    @post.content = params[:content]
    @post.price = params[:price]
    @post.address = params[:address]
    if params[:image]
      @post.photo ="#{@post.id}.jpg"
      image = params[:image]
      File.binwrite("public/post_images/#{@post.photo}",image.read)
    end
    if @post.save
      flash[:notice] ="編集が完了しました"
      redirect_to("/posts/index")
    else
      redirect_to("/posts/#{@post.id}/edit")
    end
  end

  def destroy
    @post = Post.find_by(id:params[:id])
    @post.destroy
    flash[:notice] ="削除完了しました"
    redirect_to("/posts/index")
  end

  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end

  def search
    @posts = Post.search(params[:keyword])
    @keyword =params[:keyword]
    render "index"
  end

end
