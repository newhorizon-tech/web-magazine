class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :priority

      t.timestamps
    end
    # Add initial categories
    Category.all.destroy_all
    Category.create!(name:'Web', priority: 3)
    Category.create!(name:'Mac', priority: 2)
    Category.create!(name:'Linux', priority: 1)
    Category.create!(name:'Windows', priority: 0)

  end
end
