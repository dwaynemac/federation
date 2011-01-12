class CreateUnames < ActiveRecord::Migration
  def self.up
    create_table :unames do |t|
      t.string :name
      t.references :named, :polymorphic => true

      t.timestamps
    end
  end

  def self.down
    drop_table :unames
  end
end
