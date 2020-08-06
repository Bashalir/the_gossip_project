class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
    @comment = Comment.new
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

  # GET /gossips/1/edit
  def edit
    @gossip = Gossip.find(params[:id])
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    respond_to do |format|
      format.html { redirect_to controller: 'home', action: 'index', notice: 'Le potin a bien été détruit à jamais.' }
      format.json { head :no_content }
    end
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(gossip_params)
      redirect_to @gossip
    else
      render :edit
    end
  end

  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end
end
