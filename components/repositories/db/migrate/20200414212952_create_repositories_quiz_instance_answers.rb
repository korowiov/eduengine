class CreateRepositoriesQuizInstanceAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :repositories_quiz_instance_answers do |t|
      t.uuid :quiz_instance_uuid, foreign_key: true, index: {name: 'idx_quiz_instance_on_answers'}
      t.uuid :quiz_question_uuid, foreign_key: true, index: {name: 'idx_quiz_question_on_answers'}
      t.jsonb :answer_options, null: false, default: '{}'
      t.timestamps
    end

    add_index :repositories_quiz_instance_answers, :answer_options, using: :gin
  end
end
