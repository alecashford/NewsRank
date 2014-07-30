class AddCalculatedRankToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :calculated_rank, :decimal
  end
end
