class AddRecordedDateToTransformerInformation < ActiveRecord::Migration
  def self.up
    add_column :transformer_informations, :recorded_date, :date
  end

  def self.down
    remove_column :transformer_informations, :recorded_date
  end
end