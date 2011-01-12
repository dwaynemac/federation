class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.references :monitor
      t.references :supervisor
      t.references :school

      t.string     :level

      t.string      :phone
      t.string      :email

      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end
