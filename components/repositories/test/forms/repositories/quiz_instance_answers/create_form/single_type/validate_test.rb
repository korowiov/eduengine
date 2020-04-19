require_relative '../base_test'

module RepositoriesTests
  module QuizInstanceAnswersTests
    module CreateFormTests
      module SingleTypeTests
        class ValidateTest < RepositoriesTests::QuizInstanceAnswersTests::CreateFormTests::BaseTest
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

          let(:method_call) { instance.validate(params) }

          before do
            params.merge!(
              quiz_question_uuid: quiz_question_1.uuid,
              answer_options: {
                "#{option_uuid}": [answer_uuid]
              }
            )
          end

          describe 'Method call .validate' do
            describe 'Valid params' do
              it 'returns true' do
                assert method_call
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
            end
          end
        end
      end
    end
  end
end