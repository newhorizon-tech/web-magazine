class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.references :author, null: false, foreign_key: true
      t.String :title
      t.Text :text

      t.timestamps
    end
  end
end
