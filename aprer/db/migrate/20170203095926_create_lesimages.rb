class CreateLesimages < ActiveRecord::Migration
  def change
    create_table :lesimages do |t|
      t.string :titre

      t.timestamps null: false
    end
  end
end
