class RemoveCalculatedRankFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :calculated_rank, :integer
  end
end
