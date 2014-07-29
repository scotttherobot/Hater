class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :token
      t.integer :enabled
      t.references :user, index: true

      t.timestamps
    end
  end
end
