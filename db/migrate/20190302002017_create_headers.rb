class CreateHeaders < ActiveRecord::Migration[5.2]
  def change
    create_table :headers do |t|
      t.references :document
      t.string :name
      t.integer :sequence

      t.timestamps
    end
  end
end
