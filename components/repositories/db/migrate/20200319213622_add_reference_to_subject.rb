class AddReferenceToSubject < ActiveRecord::Migration[6.0]
  def change
    add_column :repositories_resources, :subject_id, :bigint, foreign_key: true, index: {name: 'idx_subject_on_resource'}
  end
end
