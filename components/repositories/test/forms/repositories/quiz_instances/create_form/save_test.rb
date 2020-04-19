require_relative 'base_test'

module RepositoriesTests
  module QuizInstancesTests
    module CreateFormTests
      class SaveTest < BaseTest
        describe 'Method call .save' do
          it 'returns true' do
            instance.validate(params)
            assert instance.save
          end
        end
      end
    end
  end
end