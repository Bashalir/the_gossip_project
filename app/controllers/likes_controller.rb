class LikesController < ApplicationController
  def create
    @gossip = Gossip.find(params[:gossip_id])

    @like = Like.create(gossip: @gossip, user: current_user)
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
  end
end