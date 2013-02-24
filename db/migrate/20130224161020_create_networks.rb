class CreateNetworks < ActiveRecord::Migration
  def self.up
    create_table :networks do |t|
      t.integer :latency
      t.string :jitter
      t.string :date

      t.timestamps
    end
  end

  def self.down
    drop_table :networks
  end
end
