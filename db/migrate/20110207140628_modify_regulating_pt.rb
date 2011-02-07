class ModifyRegulatingPt < ActiveRecord::Migration
  def self.up
    remove_column :regulating_pts, :version
    remove_column :regulating_pts, :test_by
    remove_column :regulating_pts, :test_date
    remove_column :regulating_pts, :work_order
    remove_column :regulating_pts, :perform_type
    remove_column :regulating_pts, :transformer
    add_column :regulating_pts, :visual_inspection_id, :integer
    
  end

  def self.down
    remove_column :regulating_pts, :visual_inspection_id    
  end
end
