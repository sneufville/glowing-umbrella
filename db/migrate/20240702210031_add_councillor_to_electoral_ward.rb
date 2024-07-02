class AddCouncillorToElectoralWard < ActiveRecord::Migration[7.1]
  def change
    add_column :electoral_wards, :councillor, :string
  end
end
