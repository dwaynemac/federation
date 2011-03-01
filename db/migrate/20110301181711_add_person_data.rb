class AddPersonData < ActiveRecord::Migration
  def self.up
    add_column :people, :website, :string
    add_column :people, :blogs, :string
  end

  def self.down
    remove_column :people, :website
    remove_column :people, :blogs
  end
end
