class AddMedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :medium_id, :integer
  end
end
