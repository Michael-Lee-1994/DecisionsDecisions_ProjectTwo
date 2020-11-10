class CreateChoiceActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :choice_activities do |t|
      t.references :activity, null: false, foreign_key: true
      t.references :choice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
