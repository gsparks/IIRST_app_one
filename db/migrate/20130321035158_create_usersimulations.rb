class CreateUsersimulations < ActiveRecord::Migration
  def self.up
    create_table :usersimulations do |t|
      t.string :status
      t.integer :interval
      t.integer :numsims

      t.timestamps
    end
  end

  def self.down
    drop_table :usersimulations
  end
end
