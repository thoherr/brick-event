class AddLogoUrlToEvent < ActiveRecord::Migration
  def up
    change_table(:events) do |t|
      t.string :logo_url
    end
  end
  def down
    remove_column :events, :logo_url
  end
end
