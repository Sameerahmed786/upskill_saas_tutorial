class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :Name
      t.string :Email
      t.text :Comments
      t.timestamps
    end
  end
end
