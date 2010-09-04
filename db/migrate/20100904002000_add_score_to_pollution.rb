class AddScoreToPollution < ActiveRecord::Migration
  def self.up
    add_column :pollutions, :score, :integer
    add_column :pollutions, :score_message, :string
  end

  def self.down
    remove_column :pollutions, :score_message
    remove_column :pollutions, :score
  end
end