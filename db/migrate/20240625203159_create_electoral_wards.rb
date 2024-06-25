class CreateElectoralWards < ActiveRecord::Migration[7.1]
  def change
    create_table :electoral_wards do |t|
      t.string :name

      t.timestamps
    end
  end
end
