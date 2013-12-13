class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.string :type_of_transaction
      t.float :grand_total
      t.belongs_to :user
      t.datetime :date_of_transaction
      t.text :transaction_description

      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
