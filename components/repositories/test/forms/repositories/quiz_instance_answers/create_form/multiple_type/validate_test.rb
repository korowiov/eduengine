require_relative '../base_test'

module RepositoriesTests
  module QuizInstanceAnswersTests
    module CreateFormTests
      module MultipleTypeTests
        class ValidateTest < RepositoriesTests::QuizInstanceAnswersTests::CreateFormTests::BaseTest
          let(:option_uuid) do
            quiz_question_2
              .quiz_question_options
              .first
              .uuid
          end

          let(:answers_uuids) do
            quiz_question_2
              .quiz_question_options
              .first
              .quiz_question_answers
              .first(2)
              .map(&:uuid)
          end

          let(:method_call) { instance.validate(params) }

          before do
            params.merge!(
              quiz_question_uuid: quiz_question_2.uuid,
              answer_options: {
                "#{option_uuid}": answers_uuids
              }
            )
          end

          describe 'Method call .validate' do
            describe 'Valid params' do
              it 'returns true' do
                assert method_call
              end

              describe 'Quiz instance answer already exists' do
                let(:another_answer_uuid) do
                  quiz_question_2
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
                    quiz_question: quiz_question_2,
                    answer_options: {
                      "#{option_uuid}": [another_answer_uuid]
                    }
                  )
                end

                before do
                  quiz_instance_answer
                end

                it 'returns true' do
                  assert method_call
                end
              end
            end

            describe 'Invalid params' do
              describe 'Missing quiz instance uuid' do
                before do
                  params.merge!(quiz_instance_uuid: nil)
                end

                it 'returns false' do
                  refute method_call
                end
              end

              describe 'Invalid quiz instance uuid' do
                before do
                  params.merge!(quiz_instance_uuid: 'invalid')
                end

                it 'returns false' do
                  refute method_call
                end
              end

              describe 'Missing quiz question uuid' do
                before do
                  params.merge!(quiz_question_uuid: nil)
                end

                it 'returns false' do
                  refute method_call
                end
              end

              describe 'Invalid quiz question uuid' do
                before do
                  params.merge!(quiz_question_uuid: 'invalid')
                end

                it 'returns false' do
                  refute method_call
                end
              end

              describe 'Quiz question uuid from another quiz' do
                before do
                  params.merge!(quiz_question_uuid: quiz_question_3.uuid)
                end

                it 'returns false' do
                  refute method_call
                end
              end

              describe 'Invalid option uuid' do
                before do
                  params.merge!(answer_options: {
                    'invalid': answers_uuids
                  })
                end

                it 'returns false' do
                  refute method_call
                end
              end

              describe 'Option uuid from another question' do
                let(:another_option_uuid) do
                  quiz_question_3
                    .quiz_question_options
                    .first
                    .uuid
                end

                before do
                  params.merge!(answer_options: {
                    "#{another_option_uuid}": answers_uuids
                  })
                end

                it 'returns false' do
                  refute method_call
                end
              end

              describe 'Empty answer uuid' do
                before do
                  params.merge!(answer_options: {
                    "#{option_uuid}": []
                  })
                end

                it 'returns false' do
                  refute method_call
                end
              end

              describe 'Invalid answer uuid' do
                before do
                  params.merge!(answer_options: {
                    "#{option_uuid}": ['invalid']
                  })
                end

                it 'returns false' do
                  refute method_call
                end
              end

              describe 'Answer uuid from another question' do
                let(:another_answer_uuid) do
                  quiz_question_3
                    .quiz_question_options
                    .first
                    .quiz_question_answers
                    .first
                    .uuid
                end

                before do
                  params.merge!(answer_options: {
                    "#{option_uuid}": [another_answer_uuid]
                  })
                end

                it 'returns false' do
                  refute method_call
                end
              end
            end
          end
        end
      end
    end
  end
end