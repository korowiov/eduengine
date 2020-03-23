RailsAdmin.config do |config|
  config.excluded_models = [
    'ActiveStorage::Attachment',
    'ActiveStorage::Blob',
    'Repositories::AuthenticationToken',
    'Repositories::Resource'
  ]

  config.actions do
    dashboard do
      statistics false
    end
    index
    new
    show do
      except ['ActsAsTaggableOn::Tag']
    end
    edit do
      except ['ActsAsTaggableOn::Tag', 'Repositories::QuizQuestion']
    end
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

    config.model 'Repositories::Flashcard' do
      parent Repositories::Resources::FlashcardsDeck
    end   
  end
end
