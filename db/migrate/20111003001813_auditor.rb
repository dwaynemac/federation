class Auditor < ActiveRecord::Migration
  def self.up
    add_column :users, :auditor, :boolean, :default => false
  end

  def self.down
    remove_column :users, :auditor
  end
end
