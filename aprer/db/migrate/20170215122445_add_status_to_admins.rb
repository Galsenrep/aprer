class AddStatusToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :status, :boolean
  end
end
