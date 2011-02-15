class UserBtFederation < ActiveRecord::Migration
  def self.up
    add_column :users, :federation_id, :integer
  end

  def self.down
    remove_column :users, :federation_id
  end
end
