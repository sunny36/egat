class AddScoresToSystemLocation < ActiveRecord::Migration
  def self.up
    add_column :system_locations, :score, :integer
    add_column :system_locations, :score_message, :string
  end

  def self.down
    remove_column :system_locations, :score_message
    remove_column :system_locations, :score
  end
end