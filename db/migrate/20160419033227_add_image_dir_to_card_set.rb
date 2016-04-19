class AddImageDirToCardSet < ActiveRecord::Migration
  def change
    add_column(:card_sets, :image_dir, :string)
  end
end
