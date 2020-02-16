class CreateRepositoriesQuizQuestionAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :repositories_quiz_question_answers do |t|
      t.uuid :uuid, default: 'uuid_generate_v4()', null: false, index: true
      t.uuid :quiz_question_option_uuid, foreign_key: true, index: {name: 'idx_option_on_answer'}
      t.text :content, null: false
      t.boolean :value, default: false
      t.timestamps
    end
  end
end
