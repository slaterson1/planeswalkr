class DecksController < ApplicationController
  before:

  def new
    render 'show'
  end

  def create
    @deck = current_user.Deck.new*
  end

  def show
  end

  def index
  end
end
