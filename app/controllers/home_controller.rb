class HomeController < ApplicationController
  def index
    @gossip = Gossip.all
  end
end
