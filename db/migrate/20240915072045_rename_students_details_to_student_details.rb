class RenameStudentsDetailsToStudentDetails < ActiveRecord::Migration[7.1]
  def change
    rename_table :students_details, :student_details
  end
end
