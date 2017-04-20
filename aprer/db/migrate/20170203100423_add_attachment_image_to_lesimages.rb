class AddAttachmentImageToLesimages < ActiveRecord::Migration
  def self.up
    change_table :lesimages do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :lesimages, :image
  end
end
