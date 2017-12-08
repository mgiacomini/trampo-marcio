class CreateSubjectsStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students_subjects do |t|
      t.belongs_to :subject, index: true
      t.belongs_to :student, index: true
    end
  end
end
