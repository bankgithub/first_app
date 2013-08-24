class AddAttr2ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :birthday, :date
    add_column :users, :relationship, :string
  end
end
