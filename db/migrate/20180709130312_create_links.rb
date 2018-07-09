class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.string :short_url 
      t.string :original_url
      t.integer :cliks, default: 0

      t.timestamps
    end
    add_index :links, :short_url, unique: true
  end
end
