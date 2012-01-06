class CreateOs < ActiveRecord::Migration
  def change
    create_table :os do |t|
      t.string :name

      t.timestamps
    end
  end
end
