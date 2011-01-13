class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string      :first_name
      t.string      :last_name

      t.string     :level

      t.string      :phone
      t.string      :email

      t.references :monitor
      t.references :supervisor
      t.references :school
      t.references :federation


      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end
