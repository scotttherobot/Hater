class CreateEnemies < ActiveRecord::Migration
  def change
    create_table :enemies do |t|
      t.references :user, index: true
      t.references :person, index: true

      t.timestamps
    end
  end
end
