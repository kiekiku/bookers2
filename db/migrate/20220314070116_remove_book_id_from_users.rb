class RemoveBookIdFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :bookId, :integer
  end
end
