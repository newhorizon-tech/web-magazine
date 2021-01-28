class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :priority

      t.timestamps
    end
    # Add initial categories
    Category.all.destroy_all
    Category.create!(name:'Web', priority: 0)
    Category.create!(name:'Mac', priority: 1)
    Category.create!(name:'Linux', priority: 2)
    Category.create!(name:'Windows', priority: 3)

  end
end
