class CreateVisits < ActiveRecord::Migration[6.0]
  def change
    create_table :visits do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.string :place
      t.string :tag
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
