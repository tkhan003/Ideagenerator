class LikesController < ApplicationController
  def create
    # render text: params
    @like = Like.new(user_id: session[:user_id], idea_id: params[:idea_id])
    if @like.save
      redirect_to :back, notice: "Liked"
    else
      redirect_to :back, notice: "Couldnt Like"
    end
  end

  def destroy
    # render text: params
    @like = Like.where(id: params[:id], idea_id: params[:idea_id])[0]
    if @like.delete
      redirect_to :back, notice: "Unliked"
    else
      redirect_to :back, notice: "Cant unlike"
    end
  end
end
