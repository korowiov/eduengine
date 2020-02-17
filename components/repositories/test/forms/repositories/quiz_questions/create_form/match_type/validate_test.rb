require_relative 'base_test'

module RepositoriesTests
  module QuizQuestionsTests
    module CreateFormTests
      module MatchTypeTests
        class ValidateTest < BaseTest
          let(:method_call) { instance.validate(params) }

          describe 'Method call .validate' do
            describe 'Valid params' do
              it 'returns true' do
                assert method_call
              end
            end
          end
        end
      end
    end
  end
end