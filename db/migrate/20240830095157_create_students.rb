class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci" do |t|
      t.string :name
      t.string :subject
      t.integer :marks
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
