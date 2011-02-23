class ModifyOltcOilContaminationTable < ActiveRecord::Migration
  def self.up
    remove_column :oltc_oil_contaminations, :perform_type
    remove_column :oltc_oil_contaminations, :transformer
    add_column :oltc_oil_contaminations, :transformer_id, :integer
    add_column :oltc_oil_contaminations, :test_type, :integer
  end

  def self.down
    remove_column :oltc_oil_contaminations, :transformer_id
    remove_column :oltc_oil_contaminations, :test_type
  end
end
