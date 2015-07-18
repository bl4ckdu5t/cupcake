class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :specialty, :string
    add_column :users, :submissions, :integer
    add_column :users, :earnings, :integer
  end
end
