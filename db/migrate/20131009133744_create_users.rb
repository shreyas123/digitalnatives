class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :status
      t.references :role
      t.timestamps
    end
  end
end
