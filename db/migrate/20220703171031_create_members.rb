class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.string :FirstName
      t.string :LastName
      t.date :BirthDate
      t.string :Occupation
      t.string :ProfileImage

      t.timestamps
    end
  end
end
