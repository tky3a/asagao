class ModifyMembers < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :phone, :string
  end
end
