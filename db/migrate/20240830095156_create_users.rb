class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci" do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :password_digest
      t.timestamps
    end
  end
end
