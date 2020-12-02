class RenameSendSourceIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :send_source_id, :prefecture_id
  end
end
