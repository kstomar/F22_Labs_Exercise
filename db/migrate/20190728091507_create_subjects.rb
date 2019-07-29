class CreateSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects do |t|
      t.string :name
      t.references :exam, index: true
      t.timestamps
    end
  end
end
