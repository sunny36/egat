class CreateOltcOilQualities < ActiveRecord::Migration
  ActiveRecord::Base.transaction do
    def self.up
      create_table :oltc_oil_qualities do |t|
        t.string :name
        t.integer :u_start
        t.integer :u_end
        t.float :start
        t.float :end
        t.integer :score
        t.integer :weight
        t.timestamps
      end
      OltcOilQuality.create(:name => 'xbar', :u_start => 0, :u_end => 69,
                            :start => 0, :end => 30,
                            :score => 4, :weight => 3)
      OltcOilQuality.create(:name => 'xbar', :u_start => 0, :u_end => 69,
                            :start => 31, :end => 35,
                            :score => 3, :weight => 3)
      OltcOilQuality.create(:name => 'xbar', :u_start => 0, :u_end => 69,
                            :start => 36, :end => 45,
                            :score => 2, :weight => 3)
      OltcOilQuality.create(:name => 'xbar', :u_start => 0, :u_end => 69,
                            :start => 46, :end => nil,
                            :score => 1, :weight => 3)

      OltcOilQuality.create(:name => 'xbar', :u_start => 69, :u_end => 230,
                            :start => 0, :end => 30,
                            :score => 4, :weight => 3)
      OltcOilQuality.create(:name => 'xbar', :u_start => 69, :u_end => 230,
                            :start => 31, :end => 35,
                            :score => 3, :weight => 3)
      OltcOilQuality.create(:name => 'xbar', :u_start => 69, :u_end => 230,
                            :start => 36, :end => 45,
                            :score => 2, :weight => 3)
      OltcOilQuality.create(:name => 'xbar', :u_start => 69, :u_end => 230,
                            :start => 46, :end => nil,
                            :score => 1, :weight => 3)

      OltcOilQuality.create(:name => 'xbar', :u_start => 230, :u_end => nil,
                            :start => 0, :end => 30,
                            :score => 4, :weight => 3)
      OltcOilQuality.create(:name => 'xbar', :u_start => 230, :u_end => nil,
                            :start => 31, :end => 35,
                            :score => 3, :weight => 3)
      OltcOilQuality.create(:name => 'xbar', :u_start => 230, :u_end => nil,
                            :start => 36, :end => 45,
                            :score => 2, :weight => 3)
      OltcOilQuality.create(:name => 'xbar', :u_start => 230, :u_end => nil,
                            :start => 46, :end => nil,
                            :score => 1, :weight => 3)

      OltcOilQuality.create(:name => 'water_content', :u_start => nil, :u_end => nil,
                            :start => 0, :end => 20,
                            :score => 1, :weight => 4)
      OltcOilQuality.create(:name => 'water_content', :u_start => nil, :u_end => nil,
                            :start => 20, :end => 30,
                            :score => 2, :weight => 4)
      OltcOilQuality.create(:name => 'water_content', :u_start => nil, :u_end => nil,
                            :start => 31, :end => 40,
                            :score => 3, :weight => 4)
      OltcOilQuality.create(:name => 'water_content', :u_start => nil, :u_end => nil,
                            :start => 41, :end => 44,
                            :score => 4, :weight => 4)
      OltcOilQuality.create(:name => 'water_content', :u_start => nil, :u_end => nil,
                            :start => 45, :end => nil,
                            :score => 5, :weight => 4)

      OltcOilQuality.create(:name => 'color', :u_start => nil, :u_end => nil,
                            :start => nil, :end => 1.0,
                            :score => 1, :weight => 5)
      OltcOilQuality.create(:name => 'color', :u_start => nil, :u_end => nil,
                            :start => 1.0, :end => 2.5,
                            :score => 2, :weight => 5)
      OltcOilQuality.create(:name => 'color', :u_start => nil, :u_end => nil,
                            :start => 2.6, :end => 3.9,
                            :score => 3, :weight => 5)
      OltcOilQuality.create(:name => 'color', :u_start => nil, :u_end => nil,
                            :start => 4.0, :end => 5.4,
                            :score => 4, :weight => 5)
      OltcOilQuality.create(:name => 'color', :u_start => nil, :u_end => nil,
                            :start => 5.5, :end => nil,
                            :score => 5, :weight => 5)
    end
  end
  def self.down
    drop_table :oltc_oil_qualities
  end
end
