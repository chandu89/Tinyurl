class CreateUserIps < ActiveRecord::Migration
  def change
    create_table :user_ips do |t|
      t.string :remote_ip

      t.timestamps null: false
    end
  end
end
