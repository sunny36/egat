class FixTypoFieldsSurgeArresters < ActiveRecord::Migration
  def self.up
    rename_column :surge_arresters, :pocelain_clean_hv, :porcelain_clean_hv
    rename_column :surge_arresters, :pocelain_clean_lv, :porcelain_clean_lv
    rename_column :surge_arresters, :pocelain_clean_tv, :porcelain_clean_tv

    rename_column :surge_arresters, :pocelain_status_hv, :porcelain_status_hv
    rename_column :surge_arresters, :pocelain_status_lv, :porcelain_status_lv
    rename_column :surge_arresters, :pocelain_status_tv, :porcelain_status_tv
  end

  def self.down
  end
end
