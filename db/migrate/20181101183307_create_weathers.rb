class CreateWeathers < ActiveRecord::Migration[5.2]
  def change
    create_table :weathers do |t|
      t.float :temp
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
