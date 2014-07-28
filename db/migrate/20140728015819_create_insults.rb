class CreateInsults < ActiveRecord::Migration
  def change
    create_table :insults do |t|
      t.string :body

      t.timestamps
    end
  end
end
