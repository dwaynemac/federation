class CreateFederations < ActiveRecord::Migration
  def self.up
    create_table :federations do |t|
      t.string :name

      t.references :president
      t.references :vice_president

      t.timestamps
    end
  end

  def self.down
    drop_table :federations
  end
end
