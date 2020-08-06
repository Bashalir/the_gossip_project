class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
    @date_gossip = @gossip.created_at.strftime('Rédigé le %d/%m/%Y à %Hh%M')
    @user_name = @gossip.user.first_name + ' ' + @gossip.user.last_name
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(gossip_params)

    if @gossip.save
      redirect_to controller: 'home', action: 'index', notice: 'gossip_saved'
    else
      puts 'pas passer'
      render :new
    end
  end

  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end
end
