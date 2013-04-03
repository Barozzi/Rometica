class CreateTiles < ActiveRecord::Migration
  def change
    create_table :tiles do |t|

      t.timestamps
    end
  end
end
