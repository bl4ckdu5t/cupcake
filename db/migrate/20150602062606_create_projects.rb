class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :user_id
    	t.string :design_type
    	t.integer :package
      t.string :title
      t.string :description
      t.integer :duration # duration in days
      t.string :formats
      t.integer :stage
      t.boolean :paid, default: false
      t.timestamps null: false
    end
  end
end
