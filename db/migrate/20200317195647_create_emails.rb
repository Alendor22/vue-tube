class CreateEmails < ActiveRecord::Migration[6.0]
  def change
    create_table :emails do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.string :subject
      t.string :content
      t.boolean :read, default: false
      t.timestamps
    end
  end
end
