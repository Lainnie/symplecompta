class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.string :title, null: true
      t.money :price
      t.float :tax, null: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
