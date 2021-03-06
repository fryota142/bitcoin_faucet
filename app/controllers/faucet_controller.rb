class FaucetController < ApplicationController
  before_action :bitcoin_rpc

  def bitcoin_rpc
    config = { schema: 'http', host: 'localhost', port: 18443, user: 'user', password: 'pass' }
    @client = Bitcoin::RPC::BitcoinCoreClient.new(config)
  end

  def index
    @amount = @client.listunspent.sum { |utxo| utxo['amount'].to_f}
    @histories = History.all
  end

  def create
    txid = @client.sendtoaddress(params[:to_address], params[:amount])

    if txid
      History.create(to_address: params[:to_address], amount: params[:amount].to_f, txid: txid)
      flash[:success] = '送金に成功しました'
    end

    redirect_to root_path
  end
end
