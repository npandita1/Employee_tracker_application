class CreateMasterRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :master_roles do |t|
      t.string :name

      t.timestamps
    end
  end
end
