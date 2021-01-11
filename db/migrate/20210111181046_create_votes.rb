class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.user :references
      t.article :references

      t.timestamps
    end
  end
end
