class ChangeColorsColumnToArray < ActiveRecord::Migration
  def change
    remove_column(:cards, :colors, :string)
    add_column(:cards, :colors, :text, array: true)
  end
end
