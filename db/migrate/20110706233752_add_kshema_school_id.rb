class AddKshemaSchoolId < ActiveRecord::Migration
  def self.up
    add_column :schools, :kshema_school_id, :integer
  end

  def self.down
    remove_column :schools, :kshema_school_id
  end
end
