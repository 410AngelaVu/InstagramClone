class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.references :post
      t.references :account

      t.timestamps
    end
  end
end
