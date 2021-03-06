class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :games, dependent: :destroy
  has_many :challenges, through: :games
  has_one_attached :photo

  def completed_challenges
    challenges.joins(:games).where(games: {completed: true}).ids.uniq
  end

  def last_completed_challenge
    completed_challenges.max || 0
  end

  def challenges_left
    Challenge.count - completed_challenges.count
  end
end
