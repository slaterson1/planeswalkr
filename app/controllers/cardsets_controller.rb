class CardsetsController < ApplicationController
  before_action :administrate!, except: [:show]

  def new
    render :new
  end

  def create
    file = params[:cardset]
    begin
      data = JSON.parse(file.read)
    rescue JSON::ParserError => e
      flash[:notice] = "That JSON file is all fucked up."
      redirect_to root_path
    end
    ActiveRecord::Base.transaction do
      @set = CardSet.new(name: data["name"],
                         set_type: data["type"],
                         code: data["code"],
                         release_date: DateTime.parse(data["releaseDate"]),
                         block: data["block"],
                         image_dir: params[:image_dir])
      @cards = data["cards"].map do |card|
        Card.import_from_json(card)
      end
      @set.cards = @cards
      if @set.persisted?
        flash[:notice] = "New Set Import #{@set.name} was successful." 
        redirect_to root_path
      else
        flash[:notice] = "Import #{@set.name} Failed. Your Set is either non-existent or a duplicate."
        redirect :new
      end
    end
  end

  def index
    @cardsets = CardSet.all
    render :index
  end

  def show
    @cardset = CardSet.find_by!(code: params[:id])
    @cards = @cardset.cards.page(params[:page]).per(15)
    render :show
  end
end
