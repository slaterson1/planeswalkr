class RenameSetIdToCardSetId < ActiveRecord::Migration
  def change
    rename_column(:cards, :set_id, :card_set_id)
  end
end
