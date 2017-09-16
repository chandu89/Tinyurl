class CreateUrlmappers < ActiveRecord::Migration
  def change
    create_table :urlmappers do |t|
      t.string :url
      t.string :tinyurl

      t.timestamps null: false
    end
  end
end
