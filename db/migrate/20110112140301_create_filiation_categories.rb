class CreateFiliationCategories < ActiveRecord::Migration
  def self.up
    create_table :filiation_categories do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :filiation_categories
  end
end
