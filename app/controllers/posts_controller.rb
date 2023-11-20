class PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy, :update, :edit]

  def index
    #   Get All the post from database
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to(@post, notice: 'Post was successfully created.')
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to(@post, notice: 'Project was successfully updated.')
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  def destroy
    @post.destroy

    redirect_to(posts_path, notice: 'Project was successfully destroyed.')
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
