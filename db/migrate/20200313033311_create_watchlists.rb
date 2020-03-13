class CreateWatchlists < ActiveRecord::Migration[6.0]
  def change
    create_table :watchlists do |t|
      t.integer :user_id
      t.integer :video_id
      t.boolean :seen, default: false

      t.timestamps null: false
    end
  end
end
