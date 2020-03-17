class AddColumnPublishedAtToResources < ActiveRecord::Migration[6.0]
  def change
    add_column :repositories_resources, :published_at, :datetime, default: nil
  end
end
