class CreateRepositoriesSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :repositories_subjects do |t|
      t.string :name, null: false, unique: true
      t.string :slug, index: true, unique: true
      t.string :ancestry, index: true
      t.timestamps
    end
  end
end
