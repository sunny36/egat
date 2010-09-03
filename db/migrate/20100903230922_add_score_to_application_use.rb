class AddScoreToApplicationUse < ActiveRecord::Migration
  def self.up
    add_column :application_uses, :score, :integer
    add_column :application_uses, :score_message, :string
  end

  def self.down
    remove_column :application_uses, :score_message
    remove_column :application_uses, :score
  end
end