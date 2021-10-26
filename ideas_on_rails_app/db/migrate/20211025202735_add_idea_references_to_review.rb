class AddIdeaReferencesToReview < ActiveRecord::Migration[6.1]
  def change
    add_reference :reviews, :idea, null: false, foreign_key: true
  end
end
