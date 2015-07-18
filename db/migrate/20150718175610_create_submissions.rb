class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
    	t.integer :designer_id
    	t.integer :project_id

      t.timestamps null: false
    end
  end
end
