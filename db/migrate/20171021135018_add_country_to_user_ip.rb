class AddCountryToUserIp < ActiveRecord::Migration
  def change
    add_column :user_ips, :country, :string
  end
end
