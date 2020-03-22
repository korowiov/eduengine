class AddCounterCacheToResource < ActiveRecord::Migration[6.0]
  def change
    add_column :repositories_resources, :associations_counter, :integer, default: 0
  end
end
