class Card < ActiveRecord::Base
  belongs_to :card_set
  validates_presence_of :name, :multiverse_id
  validates :multiverse_id, uniqueness: true
  
  IMAGE_BASE_URI = "https://s3.amazonaws.com/images.planeswalker.io"

  def image_url
    "#{IMAGE_BASE_URI}/#{self.card_set.image_dir}/#{self.name}.jpg"
  end

  def self.import_from_json(card_data)
    Card.new(name: card_data["name"],
             mana_cost: card_data["manaCost"],
             converted_cost: card_data["cmc"],
             card_type: card_data["type"],
             rarity: card_data["rarity"],
             text: card_data["text"],
             flavor: card_data["flavor"],
             artist: card_data["artist"],
             power: card_data["power"],
             toughness: card_data["toughness"],
             card_number: card_data["mciNumber"],
             colors: card_data["colors"],
             multiverse_id: card_data["multiverseid"])
  end
end
