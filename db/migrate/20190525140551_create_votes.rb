class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer :course_id
      t.boolean :like
      t.string :course_type
      t.integer :user_id
      t.timestamps
    end
  end
end
