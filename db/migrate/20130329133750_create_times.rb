class CreateTimes < ActiveRecord::Migration
  def change
    create_table :times do |t|

      t.timestamps
    end
  end
end
