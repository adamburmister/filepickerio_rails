class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :image_url

      t.timestamps
    end
  end
end
