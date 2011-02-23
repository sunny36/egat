class ModifyOltcDgaTable < ActiveRecord::Migration
  def self.up
    add_column :oltc_dgas, :c3h6, :double
    add_column :oltc_dgas, :status, :string
    rename_column :oltc_dgas, :transformer, :transformer_id
    remove_column :oltc_dgas, :version
  end

  def self.down
    rename_column :oltc_dgas, :transformer_id
    remove_column :oltc_dgas, :status
    remove_column :oltc_dgas, :c3h6
  end
end