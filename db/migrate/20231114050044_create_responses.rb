class CreateResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :responses do |t|
      t.references :question, null: false, foreign_key: true
      t.references :option, foreign_key: true
      t.text :answer
      t.timestamps
    end
  end
end
