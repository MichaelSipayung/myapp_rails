class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    # the change method is the primary way of writing migrations.
    # It works for the majority of cases,
    # where Active Record knows how to reverse the migration automatically
    create_table :articles do |t| # specifies how the articles table should be constructed
      t.string :title # creates a title column of type string
      t.text :body # creates a body column of type text
      t.timestamps # creates two additional columns, created_at and updated_at, which Rails will manage for us
    end
  end
end
