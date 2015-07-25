class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :notifications, :receiver_id, :user_id
  end
end
