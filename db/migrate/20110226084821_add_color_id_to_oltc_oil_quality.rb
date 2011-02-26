class AddColorIdToOltcOilQuality < ActiveRecord::Migration
  def self.up
    add_column :oltc_oil_qualities, :color_id, :integer
  end

  def self.down
    remove_column :oltc_oil_qualities, :color_id
  end
end
