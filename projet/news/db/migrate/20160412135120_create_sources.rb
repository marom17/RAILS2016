class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :tyype
      t.string :firstname
      t.string :lastname
      t.string :name

      t.timestamps null: false
    end
  end
end
