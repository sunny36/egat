class CreateSocialAspects < ActiveRecord::Migration
  def self.up
    create_table :social_aspects do |t|
      t.string :value
      t.timestamps
    end
  end

  def self.down
    drop_table :social_aspects
  end
end
