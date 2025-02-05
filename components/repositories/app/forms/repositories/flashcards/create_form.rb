module Repositories
  module Flashcards
    class CreateForm < Repositories::BaseForm
      properties :title, :front, :back

      validates :title, presence: true
      validates :front, presence: true
      validates :back, presence: true
    end
  end
end