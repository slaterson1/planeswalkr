class CardSet < ActiveRecord::Base
  has_many :cards

  include PgSearch
  multisearchable :against => [ :name, :set_type, :code, :release_date,
                         				:block, :image_dir ]
end
