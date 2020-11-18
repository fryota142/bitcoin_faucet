class FaucetController < ApplicationController
  before_action :bitcoin_rpc

  def bitcoin_rpc
    config = { schema: 'http', host: 'localhost', port: 18443, user: 'user', password: 'pass' }
    @client = Bitcoin::RPC::BitcoinCoreClient.new(config)
  end

  def index
    @amount = @client.listunspent.sum { |utxo| utxo['amount'].to_f}
  end
end
