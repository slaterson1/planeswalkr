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
                         block: data["block"])
      @cards = data["cards"].map do |card|
        Card.new(name: card["name"],
                 mana_cost: card["manaCost"],
                 converted_cost: card["cmc"],
                 card_type: card["type"],
                 rarity: card["rarity"],
                 text: card["text"],
                 flavor: card["flavor"],
                 artist: card["artist"],
                 power: card["power"],
                 toughness: card["toughness"],
                 card_number: card["mciNumber"],
                 colors: card["colors"])
      end
      @set.cards = @cards
      @set.save
    end
    flash[:notice] = "New Set Import #{@set.name} was successful." if @set.persisted?
    redirect_to root_path
  end
end
