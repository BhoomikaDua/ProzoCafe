class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.bigint :user_id
      t.string :role
      t.string :name
      t.string :email
      t.string :password_digest
      t.datetime :created_on

      t.timestamps
    end
  end
end
