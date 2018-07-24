class AddAvailableThroughToLink < ActiveRecord::Migration[5.1]
  def change
    add_column :links, :available_through, :integer
    add_reference :links, :user, index: true, foreign_key: {on_delete: :cascade}
  end
end
