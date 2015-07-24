class AddAttachmentPreviewToSubmissions < ActiveRecord::Migration
  def self.up
    change_table :submissions do |t|
      t.attachment :preview
    end
  end

  def self.down
    remove_attachment :submissions, :preview
  end
end
