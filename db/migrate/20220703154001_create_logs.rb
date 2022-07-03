class CreateLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :logs do |t|
      t.date :DateRecieved
      t.date :DateFinished
      t.string :Comment
      t.integer :TaskID

      t.timestamps
    end
  end
end
