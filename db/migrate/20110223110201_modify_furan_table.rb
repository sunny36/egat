class ModifyFuranTable < ActiveRecord::Migration
  def self.up
    add_column :furans, :transformer_id, :integer
    add_column :furans, :test_type, :string
    remove_column :furans, :transformer
    remove_column :furans, :version
  end

  def self.down
    remove_column :furans, :test_type
    remove_column :furans, :transformer_id
  end
end