class CreatePictures < ActiveRecord::Migration[6.1]
  def change
    create_table :pictures do |t|
      t.string :url
      t.references :imageable, polymorphic: true
      t.timestamps
    end
  end
end
