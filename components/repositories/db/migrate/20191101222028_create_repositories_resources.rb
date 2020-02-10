class CreateRepositoriesResources < ActiveRecord::Migration[6.0]
  def change
    create_table :repositories_resources do |t|
      t.uuid :uuid, default: 'uuid_generate_v4()', null: false, index: true
      t.uuid :author_uuid, foreign_key: true, index: {name: 'idx_author_on_resource'}
      t.string :name, null: false
      t.text :description
      t.jsonb :settings, default: {}
      t.string :status, default: 'draft', null: false
      t.string :type, index: true
      t.timestamps
    end
  end
end
