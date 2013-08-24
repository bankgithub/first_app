class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :text
      t.integer :belong

      t.timestamps
    end
  end
end
