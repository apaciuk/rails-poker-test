class CreateCardsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :cards, id: :uuid do |t|
      t.string :face, null: false, default: ''
      t.string :suit, null: false, default: ''
      t.timestamps
    end
  end
end
