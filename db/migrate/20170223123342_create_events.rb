class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :performer
      t.datetime :start_date
      t.datetime :end_date
      t.string :location
      t.string :price

      t.timestamps null: false
    end
  end
end
