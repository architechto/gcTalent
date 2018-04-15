class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :added_by
      t.string :seniority
      t.string :type_work
      t.string :location
      t.string :linkedin

      t.timestamps
    end
  end
end
