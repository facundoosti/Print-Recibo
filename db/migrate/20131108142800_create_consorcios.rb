class CreateConsorcios < ActiveRecord::Migration[5.0]

  def change
    create_table :consorcios do |t|

      t.string   :nombre
      t.string   :ciudad

      t.timestamps
    end
  end
end


