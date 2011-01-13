class CreateObservations < ActiveRecord::Migration
  def self.up
    create_table :observations do |t|
      t.integer :observed_id
      t.integer :observer_id
      t.string :observation
      t.date :observed_on

      t.timestamps
    end
  end

  def self.down
    drop_table :observations
  end
end
