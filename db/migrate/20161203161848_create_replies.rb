class CreateReplies < ActiveRecord::Migration[5.0]
  def change
    create_table :replies do |t|
      t.string :content
      t.belongs_to :post
      t.belongs_to :user

      t.timestamps
    end
  end
end
