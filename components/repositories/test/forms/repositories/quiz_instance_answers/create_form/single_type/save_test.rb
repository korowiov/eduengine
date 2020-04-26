require_relative '../base_test'

module RepositoriesTests
  module QuizInstanceAnswersTests
    module CreateFormTests
      module SingleTypeTests
        class SaveTest < RepositoriesTests::QuizInstanceAnswersTests::CreateFormTests::BaseTest
          let(:option_uuid) do
            quiz_question_1
              .quiz_question_options
              .first
              .uuid
          end

          let(:answer_uuid) do
            quiz_question_1
              .quiz_question_options
              .first
              .quiz_question_answers
              .first
              .uuid
          end

          before do
            params.merge!(
              quiz_question_uuid: quiz_question_1.uuid,
              answer_options: {
                "#{option_uuid}": [answer_uuid]
              }
            )
          end

          describe 'Method call .save' do
            it 'returns true' do
              instance.validate(params)
              assert instance.save
            end

            it 'creates new record' do
              assert_difference 'Repositories::QuizInstanceAnswer.count', 1 do
                instance.validate(params)
                instance.save
              end
            end

            describe 'Quiz instance answer already exists' do
              let(:another_answer_uuid) do
                quiz_question_1
                  .quiz_question_options
                  .first
                  .quiz_question_answers
                  .second
                  .uuid
              end

              let(:quiz_instance_answer) do
                create(
                  :quiz_instance_answer,
                  quiz_instance: quiz_instance,
                  quiz_question: quiz_question_1,
                  answer_options: {
                    "#{option_uuid}": [another_answer_uuid]
                  }
                )
              end

              before do
                quiz_instance_answer
              end

              it 'returns true' do
                instance.validate(params)
                assert instance.save
              end
  
              it 'does not create new record' do
                assert_no_difference 'Repositories::QuizInstanceAnswer.count' do
                  instance.validate(params)
                  instance.save
                end
              end
            end
          end
        end
      end
    end
  end
end
