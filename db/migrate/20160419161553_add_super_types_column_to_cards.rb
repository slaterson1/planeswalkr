class AddSuperTypesColumnToCards < ActiveRecord::Migration
  def change
    add_column :cards, :supertypes, :string, array: true
  end
end
