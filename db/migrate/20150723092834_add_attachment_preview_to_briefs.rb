class AddAttachmentPreviewToBriefs < ActiveRecord::Migration
  def self.up
    change_table :briefs do |t|
      t.attachment :preview
    end
  end

  def self.down
    remove_attachment :briefs, :preview
  end
end
