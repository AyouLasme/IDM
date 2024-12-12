class RemoveImageFromResidences < ActiveRecord::Migration[8.0]
  def change
    remove_column :residences, :image, :string
  end
end
