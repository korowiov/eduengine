require Repositories::Engine.root.join('app', 'models', 'repositories', 'resources', 'quiz')

module Repositories
  module Resources
    class Quiz
      attr_accessor :remove_cover

      before_validation do
        self.tag_list = 
          ActsAsTaggableOn::Tag
          .where(id: tag_ids.reject(&:blank?))
          .pluck(:name)
        self.tag_ids = nil
      end

      after_save do
        cover.purge if remove_cover.eql?('1')
      end

      def authors_enum
        Repositories::Account
          .all
          .map do |subject| 
            [subject.nickname, subject.uuid]
          end
      end

      rails_admin do
        create do
          fields :name, :description, :subject
          field :author_uuid, :enum do
            enum_method do
              :authors_enum
            end
            label do
              'Author'
            end
          end
          field :tags
          field :cover, :active_storage
        end

        edit do
          fields :name, :description, :subject
          field :author_uuid, :enum do
            enum_method do
              :authors_enum
            end
            label do
              'Author'
            end
          end
          field :tags
          field :cover, :active_storage
        end

        list do
          fields :id, :uuid, :name, :subject
          field :author do
            pretty_value do
              value.nickname
            end
          end
          field :status
          field :created_at
        end

        show do
          field :cover, :active_storage
          fields :id, :uuid, :name, :subject
          field :author do
            pretty_value do
              value.nickname
            end
          end
          field :status
          field :tag_list
          field :created_at
        end

        field :subject do
          inline_add false
          inline_edit false
        end

        field :asset, :active_storage do
          delete_method :remove_cover
        end
      end
    end
  end
end