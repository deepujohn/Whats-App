class CreateSliders < ActiveRecord::Migration
  def change
    create_table :sliders do |t|
      t.string :title
      t.string :description
      t.string :image
      t.references :user, index: true

      t.timestamps
    end
  end
end
