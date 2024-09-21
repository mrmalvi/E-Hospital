class AddRoleToDoctors < ActiveRecord::Migration[7.0]
  def change
    add_column :doctors, :role, :string
  end
end
