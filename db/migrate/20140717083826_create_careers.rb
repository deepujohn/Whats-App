class CreateCareers < ActiveRecord::Migration
  def change
    create_table :careers do |t|
      t.string :first_name
      t.string :last_name
      t.string :city
      t.string :country
      t.string :email
      t.string :phone
      t.string :resume
      t.string :photo

      t.timestamps
    end
  end
end
