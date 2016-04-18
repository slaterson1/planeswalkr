class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :name
      t.string :mana_cost
      t.integer :converted_cost
      t.string :card_type
      t.string :rarity
      t.text :text
      t.text :flavor
      t.string :artist
      t.string :power
      t.string :toughness
      t.integer :set_id
      t.string :card_number
      t.string :colors

      t.timestamps null: false
    end
  end
end
