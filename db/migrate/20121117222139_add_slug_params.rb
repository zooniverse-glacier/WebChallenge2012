class AddSlugParams < ActiveRecord::Migration
  def change
    add_column :schools, :slug, :string
    add_column :universities, :slug, :string
  end
end
