class TacacsUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :tacacs_users do |t|
      t.string :username, null: false, default: ""
      t.string :password, null: false, default: ""
      t.belongs_to :user
      t.timestamps
    end
  end
end
