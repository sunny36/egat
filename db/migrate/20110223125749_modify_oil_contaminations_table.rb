class ModifyOilContaminationsTable < ActiveRecord::Migration
  def self.up
    remove_column :oil_contaminations, :perform_type
    remove_column :oil_contaminations, :transformer
    add_column :oil_contaminations, :transformer_id, :integer
    add_column :oil_contaminations, :test_type, :integer
  end

  def self.down
    remove_column :oil_contaminations, :transformer_id
    remove_column :oil_contaminations, :test_type
  end
end
