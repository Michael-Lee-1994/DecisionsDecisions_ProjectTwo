class CreateChoices < ActiveRecord::Migration[6.0]
  def change
    create_table :choices do |t|
      t.string :choice_name
      t.date :date
      t.boolean :completed
      t.integer :location_zip

      t.timestamps
    end
  end
end
