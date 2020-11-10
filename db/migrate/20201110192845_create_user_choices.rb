class CreateUserChoices < ActiveRecord::Migration[6.0]
  def change
    create_table :user_choices do |t|
      t.references :user, null: false, foreign_key: true
      t.references :choice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
