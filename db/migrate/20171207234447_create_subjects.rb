class CreateSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects do |t|
      t.belongs_to :user
      t.string :name
      t.string :teacher

      t.timestamps
    end
  end
end
