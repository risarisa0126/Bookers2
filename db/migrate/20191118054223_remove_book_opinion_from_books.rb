class RemoveBookOpinionFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :book_opinion, :text
  end
end
