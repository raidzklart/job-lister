class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :company
      t.string :title
      t.text :description
      t.string :salary
      t.string :location
      t.string :contact_user
      t.string :contact_email

      t.timestamps
    end
  end
end
