class CreateSelections < ActiveRecord::Migration
  def change
    create_table :selections do |t|
      t.integer :project_id
      t.integer :customer_id
      t.integer :designer_id
      t.integer :rank

      t.timestamps null: false
    end
  end
end
