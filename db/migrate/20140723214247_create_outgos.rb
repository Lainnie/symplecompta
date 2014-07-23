class CreateOutgos < ActiveRecord::Migration
  def change
    create_table :outgos do |t|
      t.string :title, null: true
      t.money :price
      t.references :user, index: true

      t.timestamps
    end
  end
end
