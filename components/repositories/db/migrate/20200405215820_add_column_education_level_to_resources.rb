class AddColumnEducationLevelToResources < ActiveRecord::Migration[6.0]
  def change
    add_column :repositories_resources, :education_level, :string, null: false, index: true
  end
end
