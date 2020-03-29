class AddColumnIconCode < ActiveRecord::Migration[6.0]
  def change
    add_column :repositories_subjects, :icon_code, :string, default: nil
  end
end
