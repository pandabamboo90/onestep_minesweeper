# frozen_string_literal: true

class CreateBoards < ActiveRecord::Migration[7.0]
  def change
    create_table :boards do |t|
      t.references :user, index: true, foreign_key: {to_table: :users}, null: false
      t.string :name, index: true
      t.integer :width, null: false, default: 1
      t.integer :height, null: false, default: 1
      t.integer :num_of_mines, null: false, default: 0
      t.text :grid
      t.timestamps
      t.datetime :deleted_at
    end

    add_index(:boards, %i[name, user_id], name: 'unique_idx_on_name_and_user_id', unique: true)
  end
end
