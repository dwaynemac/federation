class CreateSchools < ActiveRecord::Migration
  def self.up
    create_table :schools do |t|
      t.string :name
      
      t.references :federation
      t.references :director
      t.references :filiation_category

      t.timestamps
    end
  end

  def self.down
    drop_table :schools
  end
end
