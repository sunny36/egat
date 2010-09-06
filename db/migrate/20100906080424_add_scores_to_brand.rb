class AddScoresToBrand < ActiveRecord::Migration
  def self.up
    add_column :brands, :score, :integer
    add_column :brands, :score_message, :string
  end

  def self.down
    remove_column :brands, :score_message
    remove_column :brands, :score
  end
end