class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.string :name
      t.string :url
      t.string :path
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
