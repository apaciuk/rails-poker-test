class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards, id: :uuid do |t|
      t.string :face, null: false, index: true, limit: 10, comment: 'Face of the card', default: 'A', unique: true
      t.string :suit, null: false, index: true, limit: 10, comment: 'Suit of the card', default: 'S', unique: true

      t.timestamps
    end
  end
end
