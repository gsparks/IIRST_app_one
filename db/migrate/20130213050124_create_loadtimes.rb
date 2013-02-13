class CreateLoadtimes < ActiveRecord::Migration
  def self.up
    create_table :loadtimes do |t|
      t.float :loadtime
      t.string :page
      t.string :date

      t.timestamps
    end
  end

  def self.down
    drop_table :loadtimes
  end
end
