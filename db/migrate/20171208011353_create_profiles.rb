class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.belongs_to :user, foreign_key: true
      t.string :lattes
      t.string :facebook
      t.string :twitter

      t.timestamps
    end
  end
end
