class RenameOilInsulate < ActiveRecord::Migration
  def self.up
    rename_table :oil_insulate, :insulating_oils
  end

  def self.down
    rename_table :new_table_name, :insulating_oils
  end
end