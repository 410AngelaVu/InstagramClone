class AddDescriptionAndWebsiteToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :description, :text
    add_column :accounts, :website, :string
  end
end
