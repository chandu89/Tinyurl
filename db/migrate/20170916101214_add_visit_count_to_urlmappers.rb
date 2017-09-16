class AddVisitCountToUrlmappers < ActiveRecord::Migration
  def change
    add_column :urlmappers, :visit_count, :integer, :default => 0
  end
end
