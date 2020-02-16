class CreateRepositoriesQuizQuestionOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :repositories_quiz_question_options do |t|
      t.uuid :uuid, default: 'uuid_generate_v4()', null: false, index: true
      t.uuid :quiz_question_uuid, foreign_key: true, index: {name: 'idx_option_on_question'}
      t.text :content
      t.timestamps
    end
  end
end
