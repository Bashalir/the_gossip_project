class GossipsController < ApplicationController
  def index
    @gossip = Gossip.find(params[:id])
    @date_gossip = @gossip.created_at.strftime('Rédigé le %d/%m/%Y à %Hh%M')
    @user_name = @gossip.user.first_name + ' ' + @gossip.user.last_name
  end
end
