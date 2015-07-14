class ItemsController < ApplicationController


def new
  @comment = Comment.new
end
 
 def create
    @comment = current_user.id_comment.new(comment_params)
    authorize! :create, @comment
    if @comment.save
      redirect_to @commnet, notice: "Comment created"
    else
      render :new
    end
  end


  def edit
    authorize! :update, @comment
  end


  def destroy
    authorize! :destroy, @comment
    @comment.destroy
    redirect_to comments_path, notice: "Comment deleted"
  end
end


private

  def item_params
    params.require(:comment).permit(:author, :post)
  end

end