class CreateListItems < ActiveRecord::Migration[5.0]
  def change
    create_table :list_items do |t|
      t.references :list, index: true, foreign_key: true
      t.text :body, null: false
      t.boolean :done, default: false, null: false

      t.timestamps
    end
  end
end
