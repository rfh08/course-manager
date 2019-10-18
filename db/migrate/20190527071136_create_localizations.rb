class CreateLocalizations < ActiveRecord::Migration[5.1]
  def change
    create_table :localizations do |t|
      t.integer :location_id
      t.integer :course_id

      t.timestamps
    end
  end
end
