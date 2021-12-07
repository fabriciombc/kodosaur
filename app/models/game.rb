class Game < ApplicationRecord
  belongs_to :user
  belongs_to :challenge

  def unlocked?
    #  encontrar ultimo level que o user true
    # comprar com level game
    self.user.games.where(completed: true)
  end
end
