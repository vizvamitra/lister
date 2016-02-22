class RenameDoneToCompletedInListItems < ActiveRecord::Migration[5.0]
  def change
    rename_column :list_items, :done, :completed
  end
end
