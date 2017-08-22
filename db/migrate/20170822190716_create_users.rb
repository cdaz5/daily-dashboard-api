class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :birthday
      t.string :outlets
      t.string :football
      t.string :baseball
      t.string :basketball
      t.string :password_digest

      t.timestamps
    end
  end
end
