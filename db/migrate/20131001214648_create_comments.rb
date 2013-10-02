class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :link
      t.string :content

      t.timestamps
    end
  end
end
