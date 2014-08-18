class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :user, index: true
      t.references :board, index: true
      t.integer :role_mask

      t.timestamps
    end
    add_index :memberships, :role_mask
  end
end
