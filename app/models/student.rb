class Student < ApplicationRecord
  has_and_belongs_to_many :subjects, table_name: "students_subjects"
end
