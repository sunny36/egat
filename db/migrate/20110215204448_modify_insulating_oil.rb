class ModifyInsulatingOil < ActiveRecord::Migration
  def self.up
    remove_column :insulating_oils, :transformer
    add_column :insulating_oils, :transformer_id, :integer
    remove_column :insulating_oils, :test_kv
    add_column :insulating_oils, :test_kv_maintank, :integer
    add_column :insulating_oils, :test_kv_oltc, :integer
  end

  def self.down
    remove_column :insulating_oils, :test_kv_oltc
    remove_column :insulating_oils, :test_kv_maintank
    remove_column :insulating_oils, :transformer_id
  end
end