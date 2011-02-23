class RenameOltcDga < ActiveRecord::Migration
  def self.up
    rename_table :oltc_dga, :oltc_dgas
  end

  def self.down
    rename_table :oltc_dgas, :oltc_dga
  end
end