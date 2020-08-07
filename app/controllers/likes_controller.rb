class LikesController < ApplicationController
  def create
    @gossip = Gossip.find()
    @like = Like.create(gossip: @gossip, user: current_user)
    redirect_to request.referrer
  end

  def destroy
    @like = Like.find()
    @like.destroy
    redirect_to request.referrer
  end

end