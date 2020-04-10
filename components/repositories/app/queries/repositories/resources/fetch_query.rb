module Repositories
  module Resources
    class FetchQuery < Repositories::BaseQuery
      set_initial_scope Repositories::Resource

      def call(params)
        @params = params
        
        scoped = include_associations(scope)
        scoped = filter_by_types(scoped, types) if types?
        scoped = filter_by_education_level(scoped, education) if education?
        scoped = filter_by_subjects(scoped, subjects) if subjects?

        if sort?
          case sort
          when 'date_asc' then scoped = sort_by_oldest(scoped)
          when 'date_desc' then scoped = sort_by_newest(scoped)
          else scoped
          end
        end

        scoped
      end

      private

      attr_reader :params

      delegate :education?, :sort?, :subjects?, :types?,
               :education, :sort, :subjects, :types, to: :params

      def include_associations(scoped)
        scoped
          .includes(
            :assigned_tags, 
            :author, 
            :cover_attachment,
            subject: :parent
          ).published
      end

      def filter_by_education_level(scoped, education_level)
        education_levels = Array.wrap(education_level)
        scoped.where(education_level: education_levels)
      end

      def filter_by_tags(scoped, tags)
        tags = Array.wrap(tags)
        scoped.tagged_with(tags)
      end

      def filter_by_types(scoped, types)
        types = Array.wrap(types).map(&:classify)
        scoped.where(type: types)
      end

      def filter_by_subjects(scoped, subject_ids)
        subjects_ids =
          Repositories::Subjects::FetchQuery
          .new
          .with_childrens(Array.wrap(subject_ids))
          .pluck(:id)

        scoped.where(subject_id: subjects_ids)
      end

      def by_subject_slug(scoped, subject_slug)
        subject_resource = 
          Repositories::Subjects::FindQuery
          .new
          .by_slug(subject_slug)

        return scoped.none unless subject_resource.present?

        scoped.where(subject: subject_resource)
      end

      def sort_by_newest(scoped)
        scoped.order(published_at: :desc)
      end

      def sort_by_oldest(scoped)
        scoped.order(published_at: :asc)
      end
    end
  end
end