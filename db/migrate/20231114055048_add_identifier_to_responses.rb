class AddIdentifierToResponses < ActiveRecord::Migration[7.0]
  def change
    add_column :responses, :identifier, :string
  end
end
