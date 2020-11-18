class CreateHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :histories do |t|
      t.string :to_address
      t.float :amount
      t.string :txid

      t.timestamps
    end
  end
end
