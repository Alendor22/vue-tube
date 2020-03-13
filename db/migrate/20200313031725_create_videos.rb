class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :video_string

      t.timestamps null: false
    end
  end
end
