class AddTransformerInformationAndLoadPatternFactorToLoadPatternPerYear < ActiveRecord::Migration
  def self.up
    add_column :load_pattern_per_years, :transformer_information_id, :integer
    add_column :load_pattern_per_years, :load_pattern_factor_id, :integer
  end

  def self.down
    remove_column :load_pattern_per_years, :load_pattern_factor_id
    remove_column :load_pattern_per_years, :transformer_information_id
  end
end