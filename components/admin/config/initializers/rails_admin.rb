RailsAdmin.config do |config|
  config.excluded_models = [
    'Repositories::AuthenticationToken',
    'Repositories::Resource'
  ]

  config.actions do
    dashboard do
      statistics false
    end
    index
    new
    show
    edit
    delete

    config.model 'Repositories::QuizQuestion' do
      parent Repositories::Resources::Quiz
    end

    config.model 'Repositories::QuizQuestionOption' do
      parent Repositories::QuizQuestion
    end

    config.model 'Repositories::QuizQuestionAnswer' do
      parent Repositories::QuizQuestionOption
    end
  end
end
