class AddUderBodyToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :UserBody, :text
  end
end
