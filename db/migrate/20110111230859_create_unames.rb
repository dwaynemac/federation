class CreateUnames < ActiveRecord::Migration
  def self.up
    create_table :unames do |t|
      t.string :name
      t.string :named_class
      t.integer :named_id

      t.timestamps
    end
  end

  def self.down
    drop_table :unames
  end
end
