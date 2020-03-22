class CreateRepositoriesFlashcards < ActiveRecord::Migration[6.0]
  def change
    create_table :repositories_flashcards do |t|
      t.uuid :uuid, default: 'uuid_generate_v4()', null: false, index: true
      t.uuid :resource_uuid, foreign_key: true, index: {name: 'idx_deck_on_flashcard'}
      t.string :title, null: false
      t.text :front, null: false
      t.text :back, null: false
      t.timestamps
    end
  end
end
