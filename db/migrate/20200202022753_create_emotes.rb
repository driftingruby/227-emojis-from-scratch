class CreateEmotes < ActiveRecord::Migration[6.0]
  def change
    create_table :emotes do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :comment, null: false, foreign_key: true
      t.string :emoji, null: false

      t.timestamps
    end
  end
end
