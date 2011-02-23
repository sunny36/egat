class AddTestTypeToOltcDga < ActiveRecord::Migration
  def self.up
    add_column :oltc_dgas, :test_type, :string
    remove_column :oltc_dgas, :perform_type
  end

  def self.down
    remove_column :oltc_dgas, :test_type
  end
end