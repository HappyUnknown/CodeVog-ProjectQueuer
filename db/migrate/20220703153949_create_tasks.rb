class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :Topic
      t.string :Description
      t.date :StartDate
      t.date :ExpireDate
      t.integer :Type
      t.integer :Priority
      t.string :Comments
      t.integer :ExecutorUID
      t.integer :AuthorUID
      t.integer :ProjectID

      t.timestamps
    end
  end
end
