class AddBookIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :bookId, :integer
  end
end
