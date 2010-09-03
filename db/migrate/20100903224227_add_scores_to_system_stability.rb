class AddScoresToSystemStability < ActiveRecord::Migration
  def self.up
    add_column :system_stabilities, :score, :integer
    add_column :system_stabilities, :score_message, :string
  end

  def self.down
    remove_column :system_stabilities, :score_message
    remove_column :system_stabilities, :score
  end
end