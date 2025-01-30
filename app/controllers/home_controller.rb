class HomeController < ApplicationController
  def index
  end

  def new
    @nome = Nome.all
  end

  def create 
    
  end
end
