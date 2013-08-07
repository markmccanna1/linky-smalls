class CreateUrlTable < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string  :long_url
      t.string  :short_url
      t.integer :click_count
      t.string  :page_title

      t.timestamps
    end
  end
end
