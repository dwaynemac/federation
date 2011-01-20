class AddBooleanActiveUniyoga < ActiveRecord::Migration
  def self.up
    add_column :people, :active, :boolean
    add_column :people, :uniyoga, :boolean
  end

  def self.down
    remove_column :people, :active
    remove_column :people, :uniyoga
  end
end
