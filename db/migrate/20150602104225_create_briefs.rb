class CreateBriefs < ActiveRecord::Migration
  def change
    create_table :briefs do |t|
      t.integer :project_id
      t.boolean :is_new, default: true
      t.string :company_name
      t.text :company_description
      t.string :company_address
      t.string :city
      t.string :phone
      t.string :fax
      t.string :state
      t.integer :zip
      t.string :country
      t.string :slogan
      t.string :color_choices # add image later for image description field
      t.string :website
      t.string :recommended_website
      t.text :website_pages
      t.text :card_orientation
      t.text :additional
      t.timestamps null: false
    end
  end
end
