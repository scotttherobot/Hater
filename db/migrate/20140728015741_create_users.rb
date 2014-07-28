class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_hash
      t.string :api_token
      t.string :api_token_expire

      t.timestamps
    end
  end
end
