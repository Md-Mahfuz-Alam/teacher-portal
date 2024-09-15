class AddStudentDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :student_details do |t|
    t.string :subject
    t.integer :marks
    t.references :students, null: false, foreign_key: true
    t.timestamps
    end
    remove_column :students, :subject, :string
    remove_column :students, :marks, :integer
  end
end
