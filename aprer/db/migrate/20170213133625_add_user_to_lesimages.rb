class AddUserToLesimages < ActiveRecord::Migration
  def change
    add_reference :lesimages, :user, index: true, foreign_key: true
  end
end
