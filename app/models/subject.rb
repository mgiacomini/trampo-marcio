class Subject < ApplicationRecord
  has_and_belongs_to_many :students, table_name: "students_subjects"
  belongs_to :user
end
