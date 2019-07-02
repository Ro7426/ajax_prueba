class CreateClaims < ActiveRecord::Migration[5.2]
  def change
    create_table :claims do |t|
      t.references :user, foreign_key: true
      t.references :company, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
