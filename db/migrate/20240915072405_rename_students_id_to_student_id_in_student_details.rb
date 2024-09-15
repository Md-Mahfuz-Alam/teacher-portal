class RenameStudentsIdToStudentIdInStudentDetails < ActiveRecord::Migration[7.1]
  def change
    rename_column :student_details, :students_id, :student_id
  end
end
