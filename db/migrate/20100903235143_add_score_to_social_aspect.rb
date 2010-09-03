class AddScoreToSocialAspect < ActiveRecord::Migration
  def self.up
    add_column :social_aspects, :score, :integer
    add_column :social_aspects, :score_message, :string
  end

  def self.down
    remove_column :social_aspects, :score_message
    remove_column :social_aspects, :score
  end
end