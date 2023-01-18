class CreatePlays < ActiveRecord::Migration[7.0]
  def change
    create_table :plays, id: :uuid do |t|
      t.string :status, default: 'draw', null: false, index: true, limit: 10, comment: 'Status of the play'

      t.timestamps
    end
  end
end
