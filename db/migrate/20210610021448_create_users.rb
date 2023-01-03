class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table "users" do |t|
      t.string "email"
      t.timestamps
      t.datetime "deleted_at"
      t.index ["email"], name: "index_users_on_email", unique: true
    end
  end
end
