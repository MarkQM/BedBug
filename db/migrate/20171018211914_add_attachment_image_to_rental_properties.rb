class AddAttachmentImageToRentalProperties < ActiveRecord::Migration[4.2]
  def self.up
    change_table :rental_properties do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :rental_properties, :image
  end
end
