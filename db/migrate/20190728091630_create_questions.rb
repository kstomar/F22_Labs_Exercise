class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :name
      t.references :chapter, index: true
      t.integer :category, default: 0
      t.timestamps
    end
  end
end
