class CreateLinkVotes < ActiveRecord::Migration
  def change
    create_table :link_votes do |t|
      t.references :user, index: true, foreign_key: true
      t.references :link, index: true, foreign_key: true
      t.integer :value

      t.timestamps null: false
    end

    add_index :link_votes, [:link_id, :user_id], unique: true
  end
end
