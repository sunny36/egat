class RenameOilFuran < ActiveRecord::Migration
  def self.up
    rename_table :oil_furan, :furans
  end

  def self.down
    rename_table :furans, :oil_furan
  end
end