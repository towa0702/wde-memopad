class AddUserToMemos < ActiveRecord::Migration[8.1]
  def change
    add_reference :memos, :user, null: true, foreign_key: true
  end
end