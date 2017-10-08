class AddEtherumTransactionIdToUserAssets < ActiveRecord::Migration[5.1]
  def change
    add_column :user_assets, :ethereum_transaction_id, :string
  end
end
