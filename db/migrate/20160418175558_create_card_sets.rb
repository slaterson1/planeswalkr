class CreateCardSets < ActiveRecord::Migration
  def change
    create_table :card_sets do |t|
      t.string :set_type
      t.string :name
      t.string :code
      t.date :release_date
      t.string :block

      t.timestamps null: false
    end
  end
end
