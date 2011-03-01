class MonitoredCounterCache < ActiveRecord::Migration
  def self.up
    add_column :people, :monitored_counter, :integer
  end

  def self.down
    remove_column :people, :monitored_counter
  end
end
