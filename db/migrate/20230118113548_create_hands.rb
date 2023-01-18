class CreateHands < ActiveRecord::Migration[7.0]
  def change
    create_table :hands, id: :uuid do |t|
      t.string :cards, array: true, default: [], null: false, comment: 'Cards in the hand', index: true, using: :gin

      t.timestamps
    end
  end
end
