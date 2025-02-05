class CreateRepositoriesQuizQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :repositories_quiz_questions do |t|
      t.uuid :uuid, default: 'uuid_generate_v4()', null: false, index: true
      t.uuid :resource_uuid, foreign_key: true, index: {name: 'idx_quiz_on_question'}
      t.string :question_type, null: false, index: true
      t.timestamps
    end
  end
end
