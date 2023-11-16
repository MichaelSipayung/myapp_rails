class Article < ApplicationRecord #model  for article
  #validation for title and body
  validates :title, presence:true #title must be present (not empty)
  #body must be present and minimum 10 characters
  validates :body, presence: true, length:{minimum: 10}
end
