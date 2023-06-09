class CreateTenants < ActiveRecord::Migration[7.0]
  def change
    create_table :tenants do |t|
      t.references :tenant, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
    add_index :tenants, :name
  end
end
