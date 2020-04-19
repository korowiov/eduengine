class CreateRepositoriesQuizInstances < ActiveRecord::Migration[6.0]
  def change
    create_table :repositories_quiz_instances do |t|
      t.uuid :uuid, default: 'uuid_generate_v4()', null: false, index: true
      t.uuid :account_uuid, foreign_key: true, index: {name: 'idx_account_on_quiz_instance'}
      t.uuid :quiz_uuid, foreign_key: true, index: {name: 'idx_resource_on_quiz_instance'}
      t.integer :score, default: 0
      t.datetime :start_time
      t.datetime :end_time
      t.timestamps
    end
  end
end
