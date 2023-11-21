class CommentsController < ApplicationController
  before_action :set_comment, only: :destroy
  before_action :set_post_or_image, only: :create

  def create
    if @comment.save
      redirect_to(request.referer, notice: 'Comment was successfully created.')
    else
      redirect_to(request.referer, status: :unprocessable_entity)
    end
  end

  def destroy
    @comment.destroy

    redirect_to(request.referer, notice: 'Image was successfully destroyed.')
  end

  private

  def comments_params
    params.permit(:body)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_post_or_image
    if params[:image_id].nil?
      @comment = Post.find(params[:post_id]).comments.new(comments_params)
    else
      @comment = Image.find(params[:image_id]).comments.new(comments_params)
    end
  end
end
