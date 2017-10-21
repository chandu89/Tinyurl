class AddCountryInfoToUserIp < ActiveRecord::Migration
  def change
    add_column :user_ips, :country_code2, :string
    add_column :user_ips, :country_code3, :string
    add_column :user_ips, :continent_code, :string
  end
end
