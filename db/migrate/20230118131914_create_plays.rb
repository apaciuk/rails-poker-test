class CreatePlays < ActiveRecord::Migration[7.0]
  def change
    create_table :plays, id: :uuid do |t|
      t.integer :status, null: false, default: 0, index: true

      t.timestamps
    end
  end
end
