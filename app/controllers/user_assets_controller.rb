require 'rest-client'

class UserAssetsController < ApplicationController
  delegate :user_assets, to: :current_user

  def index
    @assets = user_assets
  end

  def create
    file = File.open(upload_params.tempfile)
    response = RestClient.post 'http://127.0.0.1:5001/api/v0/add', :myfile => file
    ipfs_hash = JSON.parse(response)["Hash"]
    contract = Ethereum::Contract.create(file: "app/contracts/HyphenTwo.sol", address: "0x465F9864766253f9a6E388034CaB01b65E3e7AF5") 
    result = contract.transact_and_wait.register("name", current_user.email, "ipfshash", ipfs_hash, "created", Time.now.to_s)
    new_asset = UserAsset.create(user_id: current_user.id, ipfs_hash: ipfs_hash, ethereum_transaction_id: result.id)
    redirect_to action: "index"
  end

  def show
  end

  def new
  end

  private

  def upload_params
    params.require(:picture)
  end
end
