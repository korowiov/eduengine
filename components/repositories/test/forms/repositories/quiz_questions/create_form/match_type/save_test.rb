require_relative 'base_test'

module RepositoriesTests
  module QuizQuestionsTests
    module CreateFormTests
      module MatchTypeTests
        class SaveTest < BaseTest
          describe 'Method call .save' do
            it 'returns true' do
              instance.validate(params)
              assert instance.save
            end

            it 'creates new record QuizQuestion' do
              assert_difference 'Repositories::QuizQuestion.count', 1 do
                instance.validate(params)
                instance.save
              end
            end

            it 'creates new records QuizQuestionOption' do
              assert_difference 'Repositories::QuizQuestionOption.count', 4 do
                instance.validate(params)
                instance.save
              end
            end

            it 'creates new records QuizQuestionAnswer' do
              assert_difference 'Repositories::QuizQuestionAnswer.count', 4 do
                instance.validate(params)
                instance.save
              end
            end

            it 'increments counter cache' do
              assert_difference 'quiz.reload.associations_counter', 1 do
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