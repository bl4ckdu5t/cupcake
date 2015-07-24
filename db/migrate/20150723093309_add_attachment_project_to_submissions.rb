class AddAttachmentProjectToSubmissions < ActiveRecord::Migration
  def self.up
    change_table :submissions do |t|
      t.attachment :project
    end
  end

  def self.down
    remove_attachment :submissions, :project
  end
end
