module LikesHelper

  def current_like(gossip)
    Like.where(user: current_user, gossip: gossip)
  end

  def liked?
    !current_like.nil?
  end
end