class CreateActvities < ActiveRecord::Migration[6.1]
  def change
    create_table :actvities do |t|
      t.string :name
      t.integer :difficulty

      t.timestamps
    end
  end
end
