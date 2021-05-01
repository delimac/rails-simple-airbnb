class AddStarsToFlats < ActiveRecord::Migration[6.1]
  def change
    add_column :flats, :stars, :integer
  end
end
