class SubjectStudent < ApplicationRecord
  self.table_name = "students_subjects"

  belongs_to :student, class_name: Student
  belongs_to :subject, class_name: Subject
end
