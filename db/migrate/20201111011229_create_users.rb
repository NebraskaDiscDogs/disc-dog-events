class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :full_name, nil: false
      t.string :username, nil: false, unique: true
      t.string :email, nil: false, unique: true
      t.string :password_digest
      t.string :role

      t.timestamps
    end
  end
end
