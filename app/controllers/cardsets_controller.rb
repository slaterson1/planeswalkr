class CardsetsController < ApplicationController
  before_action :authenticate!, except: [:show]

  def new
  end

  def create
  end
end
