class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name, null: false
      t.string :description, comment: "설명"

      t.timestamps

    end
  end
end
