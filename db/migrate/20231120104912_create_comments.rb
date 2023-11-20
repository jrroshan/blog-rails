class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.string :source_type
      t.bigint :source_id
      t.string :comment_type
      t.bigint :comment_id
      t.text :body

      t.timestamps
    end
  end
end
